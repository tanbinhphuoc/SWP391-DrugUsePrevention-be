    using AutoMapper;
    using DrugUsePreventionAPI.Exceptions;
    using DrugUsePreventionAPI.Models.DTOs.CourseRegistration;
    using DrugUsePreventionAPI.Models.Entities;
    using DrugUsePreventionAPI.Repositories;
    using DrugUsePreventionAPI.Services.Interfaces;
    using Serilog;

    namespace DrugUsePreventionAPI.Services.Implementations
    {
        public class CourseRegistrationService : ICourseRegistrationService
        {
            private readonly IUnitOfWork _unitOfWork;
            private readonly IMapper _mapper;
            private readonly VNPayHelper _vnPayHelper;
            private readonly IEmailService _emailService;

            public CourseRegistrationService(IUnitOfWork unitOfWork, IMapper mapper, VNPayHelper vnPayHelper, IEmailService emailService)
            {
                _unitOfWork = unitOfWork;
                _mapper = mapper;
                _vnPayHelper = vnPayHelper;
                _emailService = emailService;
            }

            public async Task<(CourseRegistrationDto, string)> RegisterCourseAsync(RegisterCourseDto dto, int userId, string clientIp, HttpContext context)
            {
                var course = await _unitOfWork.Courses.GetByIdAsync(dto.CourseID)
                    ?? throw new EntityNotFoundException("Course", dto.CourseID);

                if (course.Status == "Closed")
                    throw new BusinessRuleViolationException("Khóa học này đã đóng.");

                if (course.Status == "Pending")
                    throw new BusinessRuleViolationException("Khóa học này chưa mở đăng ký. Vui lòng chờ hoặc chọn khóa học khác.");

                var existing = await _unitOfWork.CourseRegistrations.GetLatestByUserAndCourseAsync(userId, dto.CourseID);

                // Nếu đã có bản ghi đăng ký
                if (existing != null)
                {
                    if (existing.PaymentStatus == "SUCCESS")
                        throw new BusinessRuleViolationException("Bạn đã đăng ký và thanh toán khóa học này.");

                    if (existing.PaymentStatus == "PENDING")
                    {
                        var reusedUrl = _vnPayHelper.CreatePaymentUrl(new Payment
                        {
                            TransactionID = existing.TransactionID,
                            Amount = existing.Amount
                        }, $"Payment for Course {course.CourseName}", clientIp, context);

                        return (_mapper.Map<CourseRegistrationDto>(existing), reusedUrl);
                    }

                    if (string.IsNullOrWhiteSpace(existing.PaymentStatus))
                    {
                        existing.RegistrationDate = DateTime.UtcNow;
                        existing.Status = "PENDING_PAYMENT";
                        existing.Amount = course.Price;
                        existing.PaymentStatus = "PENDING";
                        existing.TransactionID = $"COURSE-{existing.CourseRegistrationID}-{Guid.NewGuid()}";

                        await _unitOfWork.SaveChangesAsync();

                        var newUrl = _vnPayHelper.CreatePaymentUrl(new Payment
                        {
                            TransactionID = existing.TransactionID,
                            Amount = existing.Amount
                        }, $"Payment for Course {course.CourseName}", clientIp, context);

                        return (_mapper.Map<CourseRegistrationDto>(existing), newUrl);
                    }
                }

                // Nếu chưa từng đăng ký
                var registration = new CourseRegistration
                {
                    UserID = userId,
                    CourseID = dto.CourseID,
                    RegistrationDate = DateTime.UtcNow,
                    Status = "PENDING_PAYMENT",
                    Amount = course.Price,
                    PaymentStatus = "PENDING"
                };

                await _unitOfWork.CourseRegistrations.AddAsync(registration);
                await _unitOfWork.SaveChangesAsync();

                registration.TransactionID = $"COURSE-{registration.CourseRegistrationID}-{Guid.NewGuid()}";
                await _unitOfWork.SaveChangesAsync();

                var paymentUrl = _vnPayHelper.CreatePaymentUrl(new Payment
                {
                    TransactionID = registration.TransactionID,
                    Amount = registration.Amount
                }, $"Payment for Course {course.CourseName}", clientIp, context);

                return (_mapper.Map<CourseRegistrationDto>(registration), paymentUrl);
            }




            public async Task<CourseRegistrationDto> ConfirmPaymentAsync(int courseRegistrationId, string transactionId, string responseCode, HttpContext context)
            {
                Log.Information("Confirming payment for CourseRegistrationID: {CourseRegistrationId} with TransactionID: {TransactionId}", courseRegistrationId, transactionId);

                var reg = await _unitOfWork.CourseRegistrations.GetByIdAsync(courseRegistrationId);
                if (reg == null)
                {
                    Log.Warning("Course registration not found with ID: {CourseRegistrationId}", courseRegistrationId);
                    throw new EntityNotFoundException("CourseRegistration", courseRegistrationId);
                }

                if (reg.TransactionID != transactionId)
                {
                    Log.Error("TransactionID mismatch for {TransactionId}. Expected: {ExpectedTransactionId}", transactionId, reg.TransactionID);
                    throw new BusinessRuleViolationException("TransactionID does not match the CourseRegistration record.");
                }

                var callbackParams = context.Request.Query.ToDictionary(k => k.Key, v => v.Value.ToString());
                if (!_vnPayHelper.VerifyCallback(callbackParams))
                {
                    Log.Warning("Invalid VNPay callback for TransactionID: {TransactionId}", transactionId);
                    throw new BusinessRuleViolationException("Invalid VNPay callback.");
                }

                if (responseCode != "00")
                {
                    // Thanh toán thất bại
                    reg.PaymentStatus = "FAILED";
                    reg.Status = "CANCELED";
                    Log.Warning("Payment failed for TransactionID: {TransactionId} - ResponseCode: {ResponseCode}", transactionId, responseCode);

                    // Gửi email thông báo cho người dùng về việc thanh toán thất bại
                    var course = await _unitOfWork.Courses.GetByIdAsync(reg.CourseID);
                    var user = await _unitOfWork.Users.GetByIdAsync(reg.UserID);
                    var subjectUser = $"Payment Failed for Course Registration - {course.CourseName}";
                    var bodyUser = BuildCourseRegistrationEmailBody(reg, user.FullName, course.CourseName, "FAILED", "Your payment was not successful. Please try again.");
                    await _emailService.SendEmailAsync(user.Email, subjectUser, bodyUser, true);
                }
                else
                {
                    // Thanh toán thành công
                    reg.PaymentStatus = "SUCCESS";
                    reg.Status = "CONFIRMED";
                    Log.Information("Payment successful for TransactionID: {TransactionId}. CourseRegistrationID: {CourseRegistrationId}", transactionId, courseRegistrationId);

                    // Gửi email thông báo cho người dùng về việc thanh toán thành công
                    var course = await _unitOfWork.Courses.GetByIdAsync(reg.CourseID);
                    var user = await _unitOfWork.Users.GetByIdAsync(reg.UserID);
                    var subjectUser = $"Course Registration Successful - {course.CourseName}";
                    var bodyUser = BuildCourseRegistrationEmailBody(reg, user.FullName, course.CourseName, "CONFIRMED", "Your registration and payment were successful.");
                    await _emailService.SendEmailAsync(user.Email, subjectUser, bodyUser, true);
                }

                await _unitOfWork.SaveChangesAsync();
                return _mapper.Map<CourseRegistrationDto>(reg);
            }

            private string BuildCourseRegistrationEmailBody(CourseRegistration reg, string userName, string courseName, string paymentStatus, string additionalMessage)
            {
                return $@"
        <div style='font-family:Arial,sans-serif;'>
            <h2 style='color:#0066cc;'>Course Registration Status - {paymentStatus}</h2>
            <p>Dear <b>{userName}</b>,</p>
            <p>{additionalMessage}</p>
            <table style='border-collapse:collapse;'>
                <tr><td><b>Course:</b></td><td>{courseName}</td></tr>
                <tr><td><b>Registration Date:</b></td><td>{reg.RegistrationDate:dd/MM/yyyy}</td></tr>
                <tr><td><b>Status:</b></td><td>{paymentStatus}</td></tr>
                <tr><td><b>Price:</b></td><td>{reg.Amount:N0} VND</td></tr>
            </table>
            <p style='margin-top:20px;'>Thank you for your registration!<br/>--<br/>DrugUsePrevention Team</p>
        </div>";
            }

            public async Task<IEnumerable<CourseRegistrationDto>> GetUserRegistrationsAsync(int userId)
            {
                var items = await _unitOfWork.CourseRegistrations.GetConfirmedAndPaidByUserIdAsync(userId);
                return _mapper.Map<IEnumerable<CourseRegistrationDto>>(items);
            }

        }

    }
