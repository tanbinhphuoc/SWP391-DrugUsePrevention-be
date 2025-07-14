using AutoMapper;
using DrugUsePreventionAPI.Exceptions;
using DrugUsePreventionAPI.Models.DTOs.CourseRegistration;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Services.Interfaces;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class CourseRegistrationService : ICourseRegistrationService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        private readonly VNPayHelper _vnPayHelper;

        public CourseRegistrationService(IUnitOfWork unitOfWork, IMapper mapper, VNPayHelper vnPayHelper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _vnPayHelper = vnPayHelper;
        }

        public async Task<(CourseRegistrationDto, string)> RegisterCourseAsync(RegisterCourseDto dto, int userId, string clientIp, HttpContext context)
        {
            var course = await _unitOfWork.Courses.GetByIdAsync(dto.CourseID)
                ?? throw new EntityNotFoundException("Course", dto.CourseID);

            var existing = await _unitOfWork.CourseRegistrations
                .GetLatestByUserAndCourseAsync(userId, dto.CourseID);

            if (existing != null)
            {
                if (existing.PaymentStatus == "SUCCESS")
                    throw new BusinessRuleViolationException("Bạn đã đăng ký và thanh toán khóa học này.");

                if (string.IsNullOrWhiteSpace(existing.PaymentStatus))
                {
                    var newReg = new CourseRegistration
                    {
                        UserID = userId,
                        CourseID = dto.CourseID,
                        RegistrationDate = DateTime.UtcNow,
                        Status = "PENDING_PAYMENT",
                        Amount = course.Price,
                        PaymentStatus = "PENDING"
                    };

                    await _unitOfWork.CourseRegistrations.AddAsync(newReg);
                    await _unitOfWork.SaveChangesAsync();

                    // cập nhật TransactionID có chứa CourseRegistrationID
                    newReg.TransactionID = $"COURSE-{newReg.CourseRegistrationID}-{Guid.NewGuid()}";
                    await _unitOfWork.SaveChangesAsync();

                    var newUrl = _vnPayHelper.CreatePaymentUrl(new Payment
                    {
                        TransactionID = newReg.TransactionID,
                        Amount = newReg.Amount
                    }, $"Payment for Course {course.CourseName}", clientIp, context);

                    return (_mapper.Map<CourseRegistrationDto>(newReg), newUrl);
                }

                if (existing.PaymentStatus == "PENDING")
                {
                    var reusedUrl = _vnPayHelper.CreatePaymentUrl(new Payment
                    {
                        TransactionID = existing.TransactionID,
                        Amount = existing.Amount
                    }, $"Payment for Course {course.CourseName}", clientIp, context);

                    return (_mapper.Map<CourseRegistrationDto>(existing), reusedUrl);
                }
            }

            // Không có bản ghi nào → tạo mới
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
            Serilog.Log.Information("Bắt đầu xác nhận thanh toán cho CourseRegistrationID: {CourseRegistrationId} với TransactionID: {TransactionId}", courseRegistrationId, transactionId);

            var reg = await _unitOfWork.CourseRegistrations.GetByIdAsync(courseRegistrationId);
            if (reg == null)
            {
                Serilog.Log.Warning("Không tìm thấy bản ghi đăng ký khóa học với ID: {CourseRegistrationId}", courseRegistrationId);
                throw new EntityNotFoundException("CourseRegistration", courseRegistrationId);
            }

            if (reg.TransactionID != transactionId)
            {
                Serilog.Log.Error("TransactionID không khớp. Dữ liệu nhận: {TransactionId}, Dữ liệu hệ thống: {ExpectedTransactionId}", transactionId, reg.TransactionID);
                throw new BusinessRuleViolationException("TransactionID không khớp với bản ghi CourseRegistration.");
            }

            var callbackParams = context.Request.Query.ToDictionary(k => k.Key, v => v.Value.ToString());
            if (!_vnPayHelper.VerifyCallback(callbackParams))
            {
                Serilog.Log.Warning("VNPay callback không hợp lệ cho TransactionID: {TransactionId}", transactionId);
                throw new BusinessRuleViolationException("Invalid VNPay callback.");
            }

            if (responseCode != "00")
            {
                reg.PaymentStatus = "FAILED";
                reg.Status = "CANCELED";
                Serilog.Log.Warning("Thanh toán thất bại cho TransactionID: {TransactionId} - ResponseCode: {ResponseCode}", transactionId, responseCode);
            }
            else
            {
                reg.PaymentStatus = "SUCCESS";
                reg.Status = "CONFIRMED";
                Serilog.Log.Information("Thanh toán thành công cho TransactionID: {TransactionId}. CourseRegistrationID: {CourseRegistrationId}", transactionId, courseRegistrationId);
            }

            await _unitOfWork.SaveChangesAsync();
            return _mapper.Map<CourseRegistrationDto>(reg);
        }


        public async Task<IEnumerable<CourseRegistrationDto>> GetUserRegistrationsAsync(int userId)
        {
            var items = await _unitOfWork.CourseRegistrations.GetByUserIdAsync(userId);
            return _mapper.Map<IEnumerable<CourseRegistrationDto>>(items);
        }
    }

}
