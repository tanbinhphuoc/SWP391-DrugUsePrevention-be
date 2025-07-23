using AutoMapper;
using DrugUsePreventionAPI.Configurations;
using DrugUsePreventionAPI.Exceptions;
using DrugUsePreventionAPI.Models.DTOs.Admin;
using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.Json;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class AppointmentService : IAppointmentService 
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        private readonly VNPayHelper _vnPayHelper;
        private readonly GmailSettings _gmailSettings;
        private readonly IEmailService _emailService;
        public AppointmentService(
            IUnitOfWork unitOfWork,
            IMapper mapper,
            VNPayHelper vnPayHelper,
            IOptions<GmailSettings> gmailSettings,
            IEmailService emailService)
        {
            _unitOfWork = unitOfWork ?? throw new ArgumentNullException(nameof(unitOfWork));
            _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
            _vnPayHelper = vnPayHelper ?? throw new ArgumentNullException(nameof(vnPayHelper));
            _gmailSettings = gmailSettings.Value ?? throw new ArgumentNullException(nameof(gmailSettings));
            _emailService = emailService ?? throw new ArgumentNullException(nameof(emailService));
        }

        public async Task<IEnumerable<ConsultantDto>> GetAvailableConsultantsAsync()
        {
            Log.Information("Retrieving available consultants");
            var consultants = await _unitOfWork.Consultants.GetAvailableConsultantsAsync();
            var result = _mapper.Map<IEnumerable<ConsultantDto>>(consultants);
            Log.Information("Retrieved {Count} available consultants", result.Count());
            return result;
        }

        public async Task<IEnumerable<ConsultantScheduleResponseDto>> GetConsultantSchedulesAsync(int consultantId, DateTime startDate, DateTime endDate)
        {
            Log.Information("Retrieving schedules for consultant {ConsultantId} from {StartDate} to {EndDate}", consultantId, startDate, endDate);

            var schedules = await _unitOfWork.ConsultantSchedules.GetSchedulesWithAppointmentStatusAsync(consultantId, startDate, endDate);
            var result = schedules.Select(s => new ConsultantScheduleResponseDto
            {
                Schedule = _mapper.Map<ConsultantScheduleDto>(s.Schedule),
                AppointmentStatus = s.AppointmentStatus,
                PaymentStatus = s.PaymentStatus
            }).OrderBy(s => s.Schedule.Date).ThenBy(s => s.Schedule.StartTime);

            Log.Information("Retrieved {Count} schedules", result.Count());
            return result;
        }

        public async Task<(AppointmentDto appointment, string paymentUrl)> BookAppointmentAsync(BookAppointmentDto bookDto, int userId, string clientIp, HttpContext context = null)
        {
            Log.Information("Booking appointment for user {UserId} with consultant {ConsultantId}", userId, bookDto.ConsultantId);

            if (bookDto.ScheduleIds == null || !bookDto.ScheduleIds.Any())
            {
                Log.Warning("No schedule IDs provided");
                throw new BusinessRuleViolationException("At least one schedule ID is required.");
            }
            int durationHours = bookDto.ScheduleIds.Count;
            if (durationHours < 1 || durationHours > 3)
            {
                Log.Warning("Invalid duration {DurationHours} hours", durationHours);
                throw new BusinessRuleViolationException("Duration must be between 1 and 3 hours.");
            }

            var consultant = await _unitOfWork.Consultants.GetConsultantWithUserAsync(bookDto.ConsultantId);
            if (consultant == null || consultant.User?.Status != "Active")
            {
                Log.Warning("Consultant {ConsultantId} not found or inactive", bookDto.ConsultantId);
                throw new EntityNotFoundException("Consultant", bookDto.ConsultantId);
            }

            var schedules = await _unitOfWork.ConsultantSchedules.GetByIdsAsync(bookDto.ScheduleIds);
            if (schedules.Count != durationHours || schedules.Any(s => s.ConsultantID != bookDto.ConsultantId || !s.IsAvailable))
            {
                Log.Warning("Invalid or non-consecutive schedules for consultant {ConsultantId}", bookDto.ConsultantId);
                throw new BusinessRuleViolationException("Selected schedules are invalid or not consecutive.");
            }
            var orderedSchedules = schedules.OrderBy(s => s.ScheduleID).ToList();
            for (int i = 0; i < orderedSchedules.Count - 1; i++)
            {
                var current = orderedSchedules[i];
                var next = orderedSchedules[i + 1];
                if (current.Date != next.Date || current.EndTime != next.StartTime)
                {
                    Log.Warning("Schedules are not consecutive for consultant {ConsultantId}", bookDto.ConsultantId);
                    throw new BusinessRuleViolationException("Schedules must be consecutive.");
                }
            }

            var startDateTime = new DateTime(orderedSchedules[0].Date.Year, orderedSchedules[0].Date.Month, orderedSchedules[0].Date.Day,
                                           orderedSchedules[0].StartTime.Hours, orderedSchedules[0].StartTime.Minutes, 0);
            var endDateTime = new DateTime(orderedSchedules[durationHours - 1].Date.Year, orderedSchedules[durationHours - 1].Date.Month,
                                          orderedSchedules[durationHours - 1].Date.Day, orderedSchedules[durationHours - 1].EndTime.Hours,
                                          orderedSchedules[durationHours - 1].EndTime.Minutes, 0);

            var isOverlapping = await _unitOfWork.Appointments.IsTimeSlotBookedAsync(bookDto.ConsultantId, startDateTime, endDateTime);
            if (isOverlapping)
            {
                Log.Warning("Time slot is already booked for consultant {ConsultantId}", bookDto.ConsultantId);
                throw new BusinessRuleViolationException("Selected time slot is already booked.");
            }

            var appointment = new Appointment
            {
                UserID = userId,
                ConsultantID = bookDto.ConsultantId,
                StartDateTime = startDateTime,
                EndDateTime = endDateTime,
                Price = consultant.HourlyRate * durationHours,
                Status = "PENDING_PAYMENT",
                Note = bookDto.Note,
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow
            };

            await _unitOfWork.Appointments.AddAsync(appointment);
            await _unitOfWork.SaveChangesAsync();

            var payment = new Payment
            {
                UserID = userId,
                AppointmentID = appointment.AppointmentID,
                Amount = appointment.Price,
                PaymentMethod = "VNPAY",
                Status = "PENDING",
                TransactionID = $"{Guid.NewGuid()}-{appointment.AppointmentID}",
                PaymentDate = DateTime.UtcNow,
                RetryCount = 0
            };

            await _unitOfWork.Payments.AddAsync(payment);
            await _unitOfWork.SaveChangesAsync();

            await _unitOfWork.Appointments.UpdateAppointmentSchedulesAsync(appointment.AppointmentID, bookDto.ScheduleIds);

            var paymentUrl = _vnPayHelper.CreatePaymentUrl(payment, $"Appointment {appointment.AppointmentID} for {durationHours} hours", clientIp, context);
            var appointmentDto = _mapper.Map<AppointmentDto>(appointment);

            Log.Information("Appointment {AppointmentId} created with payment URL", appointment.AppointmentID);
            return (appointmentDto, paymentUrl);
        }

        /*
        public async Task<AppointmentDto> ConfirmPaymentAsync(int appointmentId, string transactionId, string vnpayResponseCode, HttpContext context)
        {
            Log.Information("Confirming payment for appointment {AppointmentId}, transaction {TransactionId}", appointmentId, transactionId);

            if (context == null)
            {
                Log.Error("HttpContext is null for appointment {AppointmentId}", appointmentId);
                throw new BusinessRuleViolationException("Invalid request context.");
            }

            var appointment = await _unitOfWork.Appointments.GetAppointmentWithDetailsAsync(appointmentId);
            if (appointment == null)
            {
                Log.Warning("Appointment {AppointmentId} not found", appointmentId);
                throw new EntityNotFoundException("Appointment", appointmentId);
            }

            var payment = await _unitOfWork.Payments.GetByAppointmentAndTransactionAsync(appointmentId, transactionId);
            if (payment == null)
            {
                Log.Warning("Payment for appointment {AppointmentId} not found", appointmentId);
                throw new EntityNotFoundException("Payment", appointmentId);
            }

            if (payment.Amount == null)
            {
                Log.Error("Payment amount is null for appointment {AppointmentId}", appointmentId);
                throw new BusinessRuleViolationException("Payment amount is invalid.");
            }

            int retryCount = payment.RetryCount ?? 0;
            if (retryCount >= _vnPayHelper.MaxRetryAttempts)
            {
                Log.Warning("Max retry attempts reached for appointment {AppointmentId}", appointmentId);
                appointment.Status = "CANCELED";
                payment.Status = "FAILED";
                await _unitOfWork.SaveChangesAsync();
                throw new BusinessRuleViolationException("Maximum retry attempts reached. Appointment canceled.");
            }

            var queryParams = context.Request.HasFormContentType
                ? context.Request.Form.ToDictionary(k => k.Key, v => v.Value.ToString())
                : context.Request.Query.ToDictionary(k => k.Key, v => v.Value.ToString());

            if (queryParams.Count == 0)
            {
                Log.Warning("No query parameters found in callback for appointment {AppointmentId}", appointmentId);
                throw new BusinessRuleViolationException("Invalid callback data.");
            }

            Log.Information("Request Query: {Query}", JsonSerializer.Serialize(queryParams));

            queryParams["vnp_TxnRef"] = transactionId;
            queryParams["vnp_ResponseCode"] = vnpayResponseCode;

            if (!_vnPayHelper.VerifyCallback(queryParams))
            {
                Log.Warning("Invalid VNPay callback signature for appointment {AppointmentId}", appointmentId);
                payment.RetryCount = retryCount + 1;
                await _unitOfWork.SaveChangesAsync();
                throw new BusinessRuleViolationException("Invalid payment callback signature. Please try again.");
            }

            if (queryParams.TryGetValue("vnp_Amount", out var vnpAmountStr) && !string.IsNullOrEmpty(vnpAmountStr))
            {
                if (decimal.TryParse(vnpAmountStr, out var vnpAmount) && vnpAmount / 100 != payment.Amount)
                {
                    Log.Warning("Amount mismatch: VNPay={VnpAmount}, Expected={ExpectedAmount}", vnpAmount / 100, payment.Amount);
                    throw new BusinessRuleViolationException("Payment amount mismatch.");
                }
            }
            else
            {
                Log.Warning("vnp_Amount is missing in callback for appointment {AppointmentId}", appointmentId);
                throw new BusinessRuleViolationException("Payment amount is missing.");
            }

            if (vnpayResponseCode != "00")
            {
                Log.Warning("Payment failed for appointment {AppointmentId} with code {VnpayResponseCode}", appointmentId, vnpayResponseCode);
                payment.RetryCount = retryCount + 1;
                if (payment.RetryCount >= _vnPayHelper.MaxRetryAttempts)
                {
                    appointment.Status = "CANCELED";
                    payment.Status = "FAILED";
                }
                await _unitOfWork.SaveChangesAsync();
                throw new BusinessRuleViolationException($"Payment failed with code {vnpayResponseCode}. Please try again.");
            }

            // Cập nhật trạng thái của appointment thành CONFIRMED khi thanh toán thành công
            payment.Status = "SUCCESS";
            payment.RetryCount = 0;
            appointment.Status = "CONFIRMED";  // Cập nhật status của appointment thành "CONFIRMED"

            var consultant = appointment.Consultant;
            if (consultant == null || string.IsNullOrEmpty(consultant.GoogleMeetLink))
            {
                Log.Warning("Consultant {ConsultantId} not found or no Google Meet link", appointment.ConsultantID);
                throw new BusinessRuleViolationException("Consultant has no Google Meet link configured.");
            }

            var scheduleIds = appointment.ScheduleIds?.Split(',').Select(int.Parse).ToList() ?? new List<int>();
            if (scheduleIds.Any())
            {
                var schedules = await _unitOfWork.ConsultantSchedules.GetByIdsAsync(scheduleIds);
                foreach (var schedule in schedules)
                {
                    schedule.IsAvailable = false;
                    _unitOfWork.ConsultantSchedules.Update(schedule);
                }
                await _unitOfWork.SaveChangesAsync();
            }

            await _unitOfWork.SaveChangesAsync();

            var member = appointment.User;
            if (member == null)
            {
                Log.Warning("Member not found for appointment {AppointmentId}", appointmentId);
                throw new EntityNotFoundException("User", appointment.UserID);
            }

            var meetLink = consultant.GoogleMeetLink;

            // Build Email Content
            var subjectMember = $"Appointment Confirmation - {appointment.StartDateTime:dd/MM/yyyy HH:mm}";
            var bodyMember = BuildMemberEmailBody(appointment, consultant.User, meetLink);
            await _emailService.SendEmailAsync(member.Email, subjectMember, bodyMember, true);

            var subjectConsultant = $"New Appointment Notification - {appointment.StartDateTime:dd/MM/yyyy HH:mm}";
            var bodyConsultant = BuildConsultantEmailBody(appointment, member, meetLink);
            await _emailService.SendEmailAsync(consultant.User.Email, subjectConsultant, bodyConsultant, true);

            var appointmentDto = _mapper.Map<AppointmentDto>(appointment);
            Log.Information("Payment confirmed for appointment {AppointmentId}", appointmentId);
            return appointmentDto;
        }
        */

        /*
        public async Task<AppointmentDto> ConfirmPaymentAsync(int appointmentId, string transactionId, string vnpayResponseCode, HttpContext context)
        {
            Log.Information("Confirming payment for appointment {AppointmentId}, transaction {TransactionId}", appointmentId, transactionId);

            if (context == null)
            {
                Log.Error("HttpContext is null for appointment {AppointmentId}", appointmentId);
                throw new BusinessRuleViolationException("Invalid request context.");
            }

            var appointment = await _unitOfWork.Appointments.GetAppointmentWithDetailsAsync(appointmentId);
            if (appointment == null)
            {
                Log.Warning("Appointment {AppointmentId} not found", appointmentId);
                throw new EntityNotFoundException("Appointment", appointmentId);
            }

            var payment = await _unitOfWork.Payments.GetByAppointmentAndTransactionAsync(appointmentId, transactionId);
            if (payment == null)
            {
                Log.Warning("Payment for appointment {AppointmentId} not found", appointmentId);
                throw new EntityNotFoundException("Payment", appointmentId);
            }

            if (payment.Amount == null)
            {
                Log.Error("Payment amount is null for appointment {AppointmentId}", appointmentId);
                throw new BusinessRuleViolationException("Payment amount is invalid.");
            }

            int retryCount = payment.RetryCount ?? 0;
            if (retryCount >= _vnPayHelper.MaxRetryAttempts)
            {
                Log.Warning("Max retry attempts reached for appointment {AppointmentId}", appointmentId);
                appointment.Status = "CANCELED";
                payment.Status = "FAILED";
                await _unitOfWork.SaveChangesAsync();
                throw new BusinessRuleViolationException("Maximum retry attempts reached. Appointment canceled.");
            }

            var queryParams = context.Request.HasFormContentType
                ? context.Request.Form.ToDictionary(k => k.Key, v => v.Value.ToString())
                : context.Request.Query.ToDictionary(k => k.Key, v => v.Value.ToString());

            if (queryParams.Count == 0)
            {
                Log.Warning("No query parameters found in callback for appointment {AppointmentId}", appointmentId);
                throw new BusinessRuleViolationException("Invalid callback data.");
            }

            Log.Information("Request Query: {Query}", JsonSerializer.Serialize(queryParams));

            queryParams["vnp_TxnRef"] = transactionId;
            queryParams["vnp_ResponseCode"] = vnpayResponseCode;

            if (!_vnPayHelper.VerifyCallback(queryParams))
            {
                Log.Warning("Invalid VNPay callback signature for appointment {AppointmentId}", appointmentId);
                payment.RetryCount = retryCount + 1;
                await _unitOfWork.SaveChangesAsync();
                throw new BusinessRuleViolationException("Invalid payment callback signature. Please try again.");
            }

            if (queryParams.TryGetValue("vnp_Amount", out var vnpAmountStr) && !string.IsNullOrEmpty(vnpAmountStr))
            {
                if (decimal.TryParse(vnpAmountStr, out var vnpAmount) && vnpAmount / 100 != payment.Amount)
                {
                    Log.Warning("Amount mismatch: VNPay={VnpAmount}, Expected={ExpectedAmount}", vnpAmount / 100, payment.Amount);
                    throw new BusinessRuleViolationException("Payment amount mismatch.");
                }
            }
            else
            {
                Log.Warning("vnp_Amount is missing in callback for appointment {AppointmentId}", appointmentId);
                throw new BusinessRuleViolationException("Payment amount is missing.");
            }

            // Chỉ cập nhật trạng thái appointment khi payment thành công và responseCode là "00"
            if (vnpayResponseCode == "00")
            {
                // Cập nhật trạng thái của payment và appointment
                payment.Status = "SUCCESS";
                payment.RetryCount = 0;
                appointment.Status = "CONFIRMED";  // Cập nhật trạng thái của appointment thành "CONFIRMED"

                // Cập nhật lịch hẹn không còn trống
                var consultant = appointment.Consultant;
                if (consultant == null || string.IsNullOrEmpty(consultant.GoogleMeetLink))
                {
                    Log.Warning("Consultant {ConsultantId} not found or no Google Meet link", appointment.ConsultantID);
                    throw new BusinessRuleViolationException("Consultant has no Google Meet link configured.");
                }

                var scheduleIds = appointment.ScheduleIds?.Split(',').Select(int.Parse).ToList() ?? new List<int>();
                if (scheduleIds.Any())
                {
                    var schedules = await _unitOfWork.ConsultantSchedules.GetByIdsAsync(scheduleIds);
                    foreach (var schedule in schedules)
                    {
                        schedule.IsAvailable = false;
                        _unitOfWork.ConsultantSchedules.Update(schedule);
                    }
                    await _unitOfWork.SaveChangesAsync();
                }

                // Lưu các thay đổi vào cơ sở dữ liệu
                await _unitOfWork.SaveChangesAsync();

                var member = appointment.User;
                if (member == null)
                {
                    Log.Warning("Member not found for appointment {AppointmentId}", appointmentId);
                    throw new EntityNotFoundException("User", appointment.UserID);
                }

                var meetLink = consultant.GoogleMeetLink;

                // Gửi email cho người dùng và tư vấn viên
                var subjectMember = $"Appointment Confirmation - {appointment.StartDateTime:dd/MM/yyyy HH:mm}";
                var bodyMember = BuildMemberEmailBody(appointment, consultant.User, meetLink);
                await _emailService.SendEmailAsync(member.Email, subjectMember, bodyMember, true);

                var subjectConsultant = $"New Appointment Notification - {appointment.StartDateTime:dd/MM/yyyy HH:mm}";
                var bodyConsultant = BuildConsultantEmailBody(appointment, member, meetLink);
                await _emailService.SendEmailAsync(consultant.User.Email, subjectConsultant, bodyConsultant, true);

                var appointmentDto = _mapper.Map<AppointmentDto>(appointment);
                Log.Information("Payment confirmed for appointment {AppointmentId}", appointmentId);
                return appointmentDto;
            }
            else
            {
                Log.Warning("Payment failed for appointment {AppointmentId} with response code {VnpayResponseCode}", appointmentId, vnpayResponseCode);
                // Cập nhật trạng thái nếu thanh toán thất bại
                payment.Status = "FAILED";
                appointment.Status = "CANCELED";
                await _unitOfWork.SaveChangesAsync();
                throw new BusinessRuleViolationException($"Payment failed with response code {vnpayResponseCode}. Please try again.");
            }
        }
        */

        public async Task<AppointmentDto> ConfirmPaymentAsync(int appointmentId, string transactionId, string vnpayResponseCode, HttpContext context)
        {
            Log.Information("Confirming payment for appointment {AppointmentId}, transaction {TransactionId}", appointmentId, transactionId);

            if (context == null)
            {
                Log.Error("HttpContext is null for appointment {AppointmentId}", appointmentId);
                throw new BusinessRuleViolationException("Invalid request context.");
            }

            var appointment = await _unitOfWork.Appointments.GetAppointmentWithDetailsAsync(appointmentId);
            if (appointment == null)
            {
                Log.Warning("Appointment {AppointmentId} not found", appointmentId);
                throw new EntityNotFoundException("Appointment", appointmentId);
            }

            var payment = await _unitOfWork.Payments.GetByAppointmentAndTransactionAsync(appointmentId, transactionId);
            if (payment == null)
            {
                Log.Warning("Payment for appointment {AppointmentId} not found", appointmentId);
                throw new EntityNotFoundException("Payment", appointmentId);
            }

            if (payment.Amount == null)
            {
                Log.Error("Payment amount is null for appointment {AppointmentId}", appointmentId);
                throw new BusinessRuleViolationException("Payment amount is invalid.");
            }

            int retryCount = payment.RetryCount ?? 0;
            if (retryCount >= _vnPayHelper.MaxRetryAttempts)
            {
                Log.Warning("Max retry attempts reached for appointment {AppointmentId}", appointmentId);
                appointment.Status = "CANCELED";
                payment.Status = "FAILED";
                await _unitOfWork.SaveChangesAsync();
                throw new BusinessRuleViolationException("Maximum retry attempts reached. Appointment canceled.");
            }

            var queryParams = context.Request.HasFormContentType
                ? context.Request.Form.ToDictionary(k => k.Key, v => v.Value.ToString())
                : context.Request.Query.ToDictionary(k => k.Key, v => v.Value.ToString());

            if (queryParams.Count == 0)
            {
                Log.Warning("No query parameters found in callback for appointment {AppointmentId}", appointmentId);
                throw new BusinessRuleViolationException("Invalid callback data.");
            }

            Log.Information("Request Query: {Query}", JsonSerializer.Serialize(queryParams));

            queryParams["vnp_TxnRef"] = transactionId;
            queryParams["vnp_ResponseCode"] = vnpayResponseCode;

            if (!_vnPayHelper.VerifyCallback(queryParams))
            {
                Log.Warning("Invalid VNPay callback signature for appointment {AppointmentId}", appointmentId);
                payment.RetryCount = retryCount + 1;
                await _unitOfWork.SaveChangesAsync();
                throw new BusinessRuleViolationException("Invalid payment callback signature. Please try again.");
            }

            if (queryParams.TryGetValue("vnp_Amount", out var vnpAmountStr) && !string.IsNullOrEmpty(vnpAmountStr))
            {
                if (decimal.TryParse(vnpAmountStr, out var vnpAmount) && vnpAmount / 100 != payment.Amount)
                {
                    Log.Warning("Amount mismatch: VNPay={VnpAmount}, Expected={ExpectedAmount}", vnpAmount / 100, payment.Amount);
                    throw new BusinessRuleViolationException("Payment amount mismatch.");
                }
            }
            else
            {
                Log.Warning("vnp_Amount is missing in callback for appointment {AppointmentId}", appointmentId);
                throw new BusinessRuleViolationException("Payment amount is missing.");
            }

            // Chỉ cập nhật trạng thái appointment khi payment thành công và responseCode là "00"
            if (vnpayResponseCode == "00")
            {
                // Cập nhật trạng thái của payment và appointment
                payment.Status = "SUCCESS";
                payment.RetryCount = 0;
                appointment.Status = "CONFIRMED";  // Cập nhật trạng thái của appointment thành "CONFIRMED"

                // Cập nhật lịch hẹn không còn trống
                var consultant = appointment.Consultant;
                if (consultant == null || string.IsNullOrEmpty(consultant.GoogleMeetLink))
                {
                    Log.Warning("Consultant {ConsultantId} not found or no Google Meet link", appointment.ConsultantID);
                    throw new BusinessRuleViolationException("Consultant has no Google Meet link configured.");
                }

                var scheduleIds = appointment.ScheduleIds?.Split(',').Select(int.Parse).ToList() ?? new List<int>();
                if (scheduleIds.Any())
                {
                    var schedules = await _unitOfWork.ConsultantSchedules.GetByIdsAsync(scheduleIds);
                    foreach (var schedule in schedules)
                    {
                        schedule.IsAvailable = false;
                        _unitOfWork.ConsultantSchedules.Update(schedule);
                    }
                    await _unitOfWork.SaveChangesAsync();
                }

                // Lưu các thay đổi vào cơ sở dữ liệu
                await _unitOfWork.SaveChangesAsync();

                var member = appointment.User;
                if (member == null)
                {
                    Log.Warning("Member not found for appointment {AppointmentId}", appointmentId);
                    throw new EntityNotFoundException("User", appointment.UserID);
                }

                var meetLink = consultant.GoogleMeetLink;

                // Gửi email cho người dùng và tư vấn viên
                var subjectMember = $"Appointment Confirmation - {appointment.StartDateTime:dd/MM/yyyy HH:mm}";
                var bodyMember = BuildMemberEmailBody(appointment, consultant.User, meetLink);
                await _emailService.SendEmailAsync(member.Email, subjectMember, bodyMember, true);

                var subjectConsultant = $"New Appointment Notification - {appointment.StartDateTime:dd/MM/yyyy HH:mm}";
                var bodyConsultant = BuildConsultantEmailBody(appointment, member, meetLink);
                await _emailService.SendEmailAsync(consultant.User.Email, subjectConsultant, bodyConsultant, true);

                var appointmentDto = _mapper.Map<AppointmentDto>(appointment);
                Log.Information("Payment confirmed for appointment {AppointmentId}", appointmentId);
                return appointmentDto;
            }
            else
            {
                Log.Warning("Payment failed for appointment {AppointmentId} with response code {VnpayResponseCode}", appointmentId, vnpayResponseCode);
                // Cập nhật trạng thái nếu thanh toán thất bại
                payment.Status = "FAILED";
                appointment.Status = "CANCELED";
                await _unitOfWork.SaveChangesAsync();

                // Lấy thông tin user và consultant
                var user = appointment.User;
                var consultant = appointment.Consultant;
                var appointmentTime = appointment.StartDateTime;

                // Gửi email thông báo hủy lịch cho người dùng
                var subjectMember = $"Appointment Canceled - {appointment.StartDateTime:dd/MM/yyyy HH:mm}";
                var bodyMember = BuildCancellationEmailBody(appointment, user, consultant, appointmentTime);
                await _emailService.SendEmailAsync(appointment.User.Email, subjectMember, bodyMember, true);

                // Gửi email thông báo hủy cho tư vấn viên
                var subjectConsultant = $"Appointment Canceled - {appointment.StartDateTime:dd/MM/yyyy HH:mm}";
                var bodyConsultant = BuildConsultantCancellationEmailBody(appointment, user, appointmentTime);
                await _emailService.SendEmailAsync(appointment.Consultant.User.Email, subjectConsultant, bodyConsultant, true);

                throw new BusinessRuleViolationException($"Payment failed with response code {vnpayResponseCode}. Please try again.");
            }
        }

        private string BuildCancellationEmailBody(Appointment appointment, User? user, Consultant? consultant, DateTime appointmentTime)
        {
            return $@"
<div style='font-family:Arial,sans-serif;'>
    <h2 style='color:#e76f51;'>Appointment Canceled</h2>
    <p>Dear <b>{user.FullName}</b>,</p>
    <p>We regret to inform you that your appointment with <b>{consultant.User.FullName}</b> scheduled for <b>{appointmentTime:dd/MM/yyyy HH:mm}</b> has been <span style='color:red;'>CANCELED</span> due to a payment FAILED.</p>
    <table style='border-collapse:collapse;'>
        <tr><td><b>Date:</b></td><td>{appointment.StartDateTime:dd/MM/yyyy}</td></tr>
        <tr><td><b>Time:</b></td><td>{appointment.StartDateTime:HH:mm} - {appointment.EndDateTime:HH:mm}</td></tr>
        <tr><td><b>Price:</b></td><td>{appointment.Price:N0} VND</td></tr>
    </table>
    <p style='margin-top:20px;'>Please try to rebook your appointment. We apologize for the inconvenience.<br/>--<br/>DrugUsePrevention Team</p>
</div>";
        }


        private string BuildConsultantCancellationEmailBody(Appointment appointment, User user, DateTime appointmentTime)
        {
            return $@"
<div style='font-family:Arial,sans-serif;'>
    <h2 style='color:#e76f51;'>Appointment Canceled</h2>
    <p>Dear <b>{appointment.Consultant.User.FullName}</b>,</p>
    <p>We regret to inform you that your appointment with <b>{user.FullName}</b> scheduled for <b>{appointmentTime:dd/MM/yyyy HH:mm}</b> has been <span style='color:red;'>CANCELED</span> due to a payment FAILED.</p>
    <table style='border-collapse:collapse;'>
        <tr><td><b>Client:</b></td><td>{user.FullName}</td></tr>
        <tr><td><b>Date:</b></td><td>{appointment.StartDateTime:dd/MM/yyyy}</td></tr>
        <tr><td><b>Time:</b></td><td>{appointment.StartDateTime:HH:mm} - {appointment.EndDateTime:HH:mm}</td></tr>
        <tr><td><b>Price:</b></td><td>{appointment.Price:N0} VND</td></tr>
    </table>
    <p style='margin-top:20px;'>Please be aware of this cancellation.<br/>--<br/>DrugUsePrevention Team</p>
</div>";
        }


        public async Task HandleIPNAsync(Dictionary<string, string> queryParams)
        {
            Log.Information("Processing IPN for transaction {TransactionId}", queryParams.GetValueOrDefault("vnp_TxnRef"));

            if (!_vnPayHelper.VerifyCallback(queryParams))
            {
                Log.Warning("Invalid IPN signature for transaction {TransactionId}", queryParams.GetValueOrDefault("vnp_TxnRef"));
                return;
            }

            var transactionId = queryParams["vnp_TxnRef"];
            var responseCode = queryParams["vnp_ResponseCode"];
            var appointmentId = int.Parse(transactionId.Split('-')[1]);

            var appointment = await _unitOfWork.Appointments.GetByIdAsync(appointmentId);
            if (appointment == null) return;

            var payment = await _unitOfWork.Payments.GetByAppointmentAndTransactionAsync(appointmentId, transactionId);
            if (payment == null) return;

            if (responseCode == "00")
            {
                appointment.Status = "CONFIRMED";
                payment.Status = "SUCCESS";
                Log.Information("IPN confirmed payment for appointment {AppointmentId}", appointmentId);
            }
            else
            {
                appointment.Status = "CANCELED";
                payment.Status = "FAILED";
                Log.Warning("IPN reported payment failure for appointment {AppointmentId} with code {ResponseCode}", appointmentId, responseCode);
            }

            await _unitOfWork.SaveChangesAsync();
        }

        public async Task<IEnumerable<AppointmentDto>> GetUserAppointmentsAsync(int userId)
        {
            Log.Information("Retrieving appointments for user {UserId}", userId);
            var appointments = await _unitOfWork.Appointments.GetByUserIdAsync(userId);
            var result = _mapper.Map<IEnumerable<AppointmentDto>>(appointments);
            Log.Information("Retrieved {Count} appointments for user {UserId}", result.Count(), userId);
            return result;
        }

        public async Task<IEnumerable<AppointmentDto>> GetConsultantAppointmentsAsync(int consultantId)
        {
            Log.Information("Retrieving appointments for consultant {ConsultantId}", consultantId);

            var appointments = await _unitOfWork.Appointments.GetByConsultantIdAsync(consultantId);

            var result = _mapper.Map<IEnumerable<AppointmentDto>>(appointments);

            Log.Information("Retrieved {Count} appointments for consultant {ConsultantId}", result.Count(), consultantId);
            return result;
        }


        public async Task<IEnumerable<PaymentHistoryDto>> GetPaymentHistoryAsync(int userId, bool isAdmin, DateTime? startDate, DateTime? endDate)
        {
            Log.Information("Retrieving payment history for user {UserId}, isAdmin: {IsAdmin}", userId, isAdmin);

            IEnumerable<Payment> payments;
            if (isAdmin)
            {
                // Admin: Lấy tất cả giao dịch SUCCESS của mọi user
                payments = await _unitOfWork.Payments.GetAllPaymentsAsync(startDate, endDate, "SUCCESS");
            }
            else
            {
                // Member: Lấy giao dịch SUCCESS của userId
                payments = await _unitOfWork.Payments.GetPaymentsByUserIdAsync(userId, startDate, endDate);
                payments = payments.Where(p => p.Status == "SUCCESS").ToList();
            }

            var result = _mapper.Map<IEnumerable<PaymentHistoryDto>>(payments);
            Log.Information("Retrieved {Count} payment records for user {UserId}", result.Count(), userId);
            return result;
        }


        public async Task<AppointmentStatDto> GetAppointmentStatisticsAsync(DateTime? startDate, DateTime? endDate)
        {
            return await _unitOfWork.Appointments.GetAppointmentStatisticsAsync(startDate, endDate);
        }

        public async Task<PaymentStatDto> GetPaymentStatisticsAsync(DateTime? startDate, DateTime? endDate)
        {
            return await _unitOfWork.Payments.GetPaymentStatisticsAsync(startDate, endDate);
        }

        public async Task<IEnumerable<AppointmentAdmindto>> GetAllAppointmentsAsync()
        {
            Log.Information("Retrieving all appointments");

            var items = await _unitOfWork.Appointments.GetAllAppointmentsAsync();
            var result = _mapper.Map<IEnumerable<AppointmentAdmindto>>(items);
            // Xử lý PaymentStatus in-memory
            result = result.Select(a =>
            {
                var appointment = items.FirstOrDefault(x => x.AppointmentID == a.AppointmentID);
                if (appointment != null && appointment.Payments != null)
                {
                    var latestPayment = appointment.Payments.OrderByDescending(p => p.PaymentDate).FirstOrDefault();
                    a.PaymentStatus = latestPayment?.Status ?? "PENDING";
                }
                else
                {
                    a.PaymentStatus = "PENDING"; // Giá trị mặc định nếu không có Payments
                }
                return a;
            }).ToList();

            Log.Information("Retrieved {Count} appointments", result.Count());
            return result;
        }

        public async Task<AppointmentDto> BookFreeAppointmentAsync(BookAppointmentDto bookDto, int userId)
        {
            Log.Information("Booking free appointment for user {UserId} with consultant {ConsultantId}", userId, bookDto.ConsultantId);

            if (bookDto.ScheduleIds == null || !bookDto.ScheduleIds.Any())
            {
                Log.Warning("No schedule IDs provided for free appointment");
                throw new BusinessRuleViolationException("At least one schedule ID is required.");
            }
            int durationHours = bookDto.ScheduleIds.Count;
            if (durationHours < 1 || durationHours > 3)
            {
                Log.Warning("Invalid duration {DurationHours} hours for free appointment", durationHours);
                throw new BusinessRuleViolationException("Duration must be between 1 and 3 hours.");
            }

            var consultant = await _unitOfWork.Consultants.GetConsultantWithUserAsync(bookDto.ConsultantId);
            if (consultant == null || consultant.User?.Status != "Active")
            {
                Log.Warning("Consultant {ConsultantId} not found or inactive", bookDto.ConsultantId);
                throw new EntityNotFoundException("Consultant", bookDto.ConsultantId);
            }

            var schedules = await _unitOfWork.ConsultantSchedules.GetByIdsAsync(bookDto.ScheduleIds);
            if (schedules.Count != durationHours || schedules.Any(s => s.ConsultantID != bookDto.ConsultantId || !s.IsAvailable))
            {
                Log.Warning("Invalid or non-consecutive schedules for consultant {ConsultantId}", bookDto.ConsultantId);
                throw new BusinessRuleViolationException("Selected schedules are invalid or not consecutive.");
            }
            var orderedSchedules = schedules.OrderBy(s => s.ScheduleID).ToList();
            for (int i = 0; i < orderedSchedules.Count - 1; i++)
            {
                var current = orderedSchedules[i];
                var next = orderedSchedules[i + 1];
                if (current.Date != next.Date || current.EndTime != next.StartTime)
                {
                    Log.Warning("Schedules are not consecutive for consultant {ConsultantId}", bookDto.ConsultantId);
                    throw new BusinessRuleViolationException("Schedules must be consecutive.");
                }
            }

            var startDateTime = new DateTime(orderedSchedules[0].Date.Year, orderedSchedules[0].Date.Month, orderedSchedules[0].Date.Day,
                                           orderedSchedules[0].StartTime.Hours, orderedSchedules[0].StartTime.Minutes, 0);
            var endDateTime = new DateTime(orderedSchedules[durationHours - 1].Date.Year, orderedSchedules[durationHours - 1].Date.Month,
                                          orderedSchedules[durationHours - 1].Date.Day, orderedSchedules[durationHours - 1].EndTime.Hours,
                                          orderedSchedules[durationHours - 1].EndTime.Minutes, 0);

            var isOverlapping = await _unitOfWork.Appointments.IsTimeSlotBookedAsync(bookDto.ConsultantId, startDateTime, endDateTime);
            if (isOverlapping)
            {
                Log.Warning("Time slot is already booked for consultant {ConsultantId}", bookDto.ConsultantId);
                throw new BusinessRuleViolationException("Selected time slot is already booked.");
            }

            var appointment = new Appointment
            {
                UserID = userId,
                ConsultantID = bookDto.ConsultantId,
                StartDateTime = startDateTime,
                EndDateTime = endDateTime,
                Price = 0, // Free appointment
                Status = "PENDING",
                Note = bookDto.Note,
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow,
                ScheduleIds = string.Join(",", bookDto.ScheduleIds)
            };

            await _unitOfWork.Appointments.AddAsync(appointment);
            await _unitOfWork.SaveChangesAsync();

            var savedAppointment = await _unitOfWork.Appointments.GetAppointmentWithDetailsAsync(appointment.AppointmentID);
            var appointmentDto = _mapper.Map<AppointmentDto>(appointment);
            Log.Information("Free appointment {AppointmentId} created", appointment.AppointmentID);
            return appointmentDto;
        }

        public async Task<AppointmentDto> ConfirmFreeAppointmentAsync(int appointmentId, int confirmerId)
        {
            Log.Information("Confirming free appointment {AppointmentId} by UserID={ConfirmerId}", appointmentId, confirmerId);

            var appointment = await _unitOfWork.Appointments.GetAppointmentWithDetailsAsync(appointmentId);
            if (appointment == null)
            {
                Log.Warning("Appointment {AppointmentId} not found", appointmentId);
                throw new EntityNotFoundException("Appointment", appointmentId);
            }

            if (appointment.Status != "PENDING")
            {
                Log.Warning("Appointment {AppointmentId} is not in PENDING status", appointmentId);
                throw new InvalidOperationException("Only PENDING appointments can be confirmed.");
            }

            var confirmer = await _unitOfWork.Users.GetByIdAsync(confirmerId);
            if (confirmer == null)
            {
                Log.Warning("Confirmer UserID={ConfirmerId} not found", confirmerId);
                throw new EntityNotFoundException("User", confirmerId);
            }

            var consultant = await _unitOfWork.Consultants.GetByUserIdAsync(confirmerId);
            var isStaff = confirmer.Role.RoleName == "Staff";
            if (consultant == null && !isStaff)
            {
                Log.Warning("UserID={ConfirmerId} is neither a consultant nor staff", confirmerId);
                throw new UnauthorizedAccessException("Only consultants or staff can confirm appointments.");
            }

            if (consultant != null && consultant.ConsultantID != appointment.ConsultantID)
            {
                Log.Warning("Consultant UserID={ConfirmerId} is not assigned to appointment {AppointmentId}", confirmerId, appointmentId);
                throw new UnauthorizedAccessException("You can only confirm your own appointments.");
            }

            appointment.Status = "CONFIRMED";
            appointment.UpdatedAt = DateTime.UtcNow;

            var scheduleIds = appointment.ScheduleIds?.Split(',').Select(int.Parse).ToList() ?? new List<int>();
            if (scheduleIds.Any())
            {
                var schedules = await _unitOfWork.ConsultantSchedules.GetByIdsAsync(scheduleIds);
                foreach (var schedule in schedules)
                {
                    schedule.IsAvailable = false;
                    _unitOfWork.ConsultantSchedules.Update(schedule);
                }
            }

            await _unitOfWork.SaveChangesAsync();

            var member = appointment.User;
            if (member == null)
            {
                Log.Warning("Member not found for appointment {AppointmentId}", appointmentId);
                throw new EntityNotFoundException("User", appointment.UserID);
            }

            var consultantEntity = appointment.Consultant;
            if (consultantEntity == null || string.IsNullOrEmpty(consultantEntity.GoogleMeetLink))
            {
                Log.Warning("Consultant {ConsultantId} not found or no Google Meet link", appointment.ConsultantID);
                throw new BusinessRuleViolationException("Consultant has no Google Meet link configured.");
            }

            var meetLink = consultantEntity.GoogleMeetLink;

            var subjectMember = $"Free Appointment Confirmation - {appointment.StartDateTime:dd/MM/yyyy HH:mm}";
            var bodyMember = BuildMemberEmailBody(appointment, consultantEntity.User, meetLink);
            await _emailService.SendEmailAsync(member.Email, subjectMember, bodyMember, true);

            var subjectConsultant = $"New Free Appointment Notification - {appointment.StartDateTime:dd/MM/yyyy HH:mm}";
            var bodyConsultant = BuildConsultantEmailBody(appointment, member, meetLink);
            await _emailService.SendEmailAsync(consultantEntity.User.Email, subjectConsultant, bodyConsultant, true);

            var appointmentDto = _mapper.Map<AppointmentDto>(appointment);
            Log.Information("Free appointment {AppointmentId} confirmed", appointmentId);
            return appointmentDto;
        }

        public async Task CancelAppointmentAsync(int appointmentId, int userId, string userRole)
        {
            Log.Information("Canceling appointment {AppointmentId} by UserID={UserId} with role {UserRole}", appointmentId, userId, userRole);

            var appointment = await _unitOfWork.Appointments.GetAppointmentWithDetailsAsync(appointmentId);
            if (appointment == null)
            {
                Log.Warning("Appointment {AppointmentId} not found", appointmentId);
                throw new EntityNotFoundException("Appointment", appointmentId);
            }

            if (appointment.Status == "CANCELED")
            {
                Log.Warning("Appointment {AppointmentId} is already canceled", appointmentId);
                throw new InvalidOperationException("Appointment is already canceled.");
            }

            var isMember = userRole == "Member";
            var isConsultant = userRole == "Consultant";
            var isStaff = userRole == "Staff";

            if (isMember && appointment.UserID != userId)
            {
                Log.Warning("UserID={UserId} is not authorized to cancel appointment {AppointmentId}", userId, appointmentId);
                throw new UnauthorizedAccessException("You can only cancel your own appointments.");
            }

            if (isConsultant)
            {
                var Consultant = await _unitOfWork.Consultants.GetByUserIdAsync(userId);
                if (Consultant == null || Consultant.ConsultantID != appointment.ConsultantID)
                {
                    Log.Warning("Consultant UserID={UserId} is not assigned to appointment {AppointmentId}", userId, appointmentId);
                    throw new UnauthorizedAccessException("You can only cancel your own appointments.");
                }
            }

            if (isMember && appointment.StartDateTime < DateTime.UtcNow.AddHours(1))
            {
                Log.Warning("Member attempted to cancel appointment {AppointmentId} less than 1 hour before start time", appointmentId);
                throw new InvalidOperationException("Members cannot cancel appointments less than 1 hour before the start time.");
            }

            appointment.Status = "CANCELED";
            appointment.CanceledByRole = userRole; // Lưu vai trò hủy
            appointment.UpdatedAt = DateTime.UtcNow;

            var scheduleIds = appointment.ScheduleIds?.Split(',').Select(int.Parse).ToList() ?? new List<int>();
            if (scheduleIds.Any())
            {
                var schedules = await _unitOfWork.ConsultantSchedules.GetByIdsAsync(scheduleIds);
                foreach (var schedule in schedules)
                {
                    schedule.IsAvailable = isMember; // Mở lại khung giờ nếu Member hủy, giữ false nếu Consultant/Staff hủy
                    _unitOfWork.ConsultantSchedules.Update(schedule);
                }
            }

            await _unitOfWork.SaveChangesAsync();

            var member = appointment.User;
            var consultant = appointment.Consultant;
            var appointmentTime = appointment.StartDateTime;

            var subjectMember = $"Appointment Canceled - {appointmentTime:dd/MM/yyyy HH:mm}";
            var bodyMember = BuildCancellationEmailBody(appointment, member, consultant, appointmentTime);
            await _emailService.SendEmailAsync(member.Email, subjectMember, bodyMember, true);

            var subjectConsultant = $"Appointment Canceled - {appointmentTime:dd/MM/yyyy HH:mm}";
            var bodyConsultant = BuildConsultantCancellationEmailBody(appointment, member, appointmentTime);
            await _emailService.SendEmailAsync(consultant.User.Email, subjectConsultant, bodyConsultant, true);

            Log.Information("Appointment {AppointmentId} canceled by UserID={UserId}", appointmentId, userId);
        }

        public async Task UpdateAppointmentStatusAsync(int appointmentId, string newStatus)
        {
            Log.Information("Updating status for appointment {AppointmentId} to {NewStatus}", appointmentId, newStatus);

            var appointment = await _unitOfWork.Appointments.GetByIdAsync(appointmentId);
            if (appointment == null)
            {
                Log.Warning("Appointment {AppointmentId} not found", appointmentId);
                throw new EntityNotFoundException("Appointment", appointmentId);
            }

            if (!new[] { "PENDING", "PENDING_PAYMENT", "CONFIRMED", "CANCELED" }.Contains(newStatus))
            {
                Log.Warning("Invalid status {NewStatus} for appointment {AppointmentId}", newStatus, appointmentId);
                throw new BusinessRuleViolationException("Invalid status. Allowed values: PENDING, PENDING_PAYMENT, CONFIRMED, CANCELED.");
            }

            appointment.Status = newStatus;
            appointment.UpdatedAt = DateTime.UtcNow;
            _unitOfWork.Appointments.Update(appointment);
            await _unitOfWork.SaveChangesAsync();

            Log.Information("Updated status for appointment {AppointmentId} to {NewStatus}", appointmentId, newStatus);
        }


        public async Task ResendAppointmentEmailAsync(int appointmentId)
        {
            Log.Information("Resending confirmation email for appointment {AppointmentId}", appointmentId);

            var appointment = await _unitOfWork.Appointments.GetAppointmentWithDetailsAsync(appointmentId);
            if (appointment == null)
            {
                Log.Warning("Appointment {AppointmentId} not found", appointmentId);
                throw new EntityNotFoundException("Appointment", appointmentId);
            }

            var consultant = appointment.Consultant;
            var member = appointment.User;
            var meetLink = consultant.GoogleMeetLink;

            var subjectMember = $"Appointment Confirmation - {appointment.StartDateTime:dd/MM/yyyy HH:mm}";
            var bodyMember = BuildMemberEmailBody(appointment, consultant.User, meetLink);
            await _emailService.SendEmailAsync(member.Email, subjectMember, bodyMember, true);

            var subjectConsultant = $"New Appointment Notification - {appointment.StartDateTime:dd/MM/yyyy HH:mm}";
            var bodyConsultant = BuildConsultantEmailBody(appointment, member, meetLink);
            await _emailService.SendEmailAsync(consultant.User.Email, subjectConsultant, bodyConsultant, true);

            Log.Information("Confirmation emails resent for appointment {AppointmentId}", appointmentId);
        }

        private string BuildMemberEmailBody(Appointment appointment, User consultant, string meetLink)
        {
            return $@"
    <div style='font-family:Arial,sans-serif;'>
        <h2 style='color:#0066cc;'>Appointment Confirmation</h2>
        <p>Dear <b>{appointment.User.FullName}</b>,</p>
        <p>Your appointment with <b>{consultant.FullName}</b> has been <span style='color:green;'>confirmed</span>.</p>
        <table style='border-collapse:collapse;'>
            <tr><td><b>Date:</b></td><td>{appointment.StartDateTime:dd/MM/yyyy}</td></tr>
            <tr><td><b>Time:</b></td><td>{appointment.StartDateTime:HH:mm} - {appointment.EndDateTime:HH:mm}</td></tr>
            <tr><td><b>Google Meet:</b></td><td><a href='{meetLink}' style='color:#2a9d8f;'>{meetLink}</a></td></tr>
            <tr><td><b>Price:</b></td><td>{appointment.Price:N0} VND</td></tr>
        </table>
        <p style='margin-top:20px;'>Thank you for using our service!<br/>--<br/>DrugUsePrevention Team</p>
    </div>";
        }

        private string BuildConsultantEmailBody(Appointment appointment, User member, string meetLink)
        {
            return $@"
    <div style='font-family:Arial,sans-serif;'>
        <h2 style='color:#e76f51;'>New Appointment Notification</h2>
        <p>Dear <b>{appointment.Consultant.User.FullName}</b>,</p>
        <p>You have a <span style='color:green;'>new confirmed appointment</span>!</p>
        <table style='border-collapse:collapse;'>
            <tr><td><b>Client:</b></td><td>{member.FullName}</td></tr>
            <tr><td><b>Date:</b></td><td>{appointment.StartDateTime:dd/MM/yyyy}</td></tr>
            <tr><td><b>Time:</b></td><td>{appointment.StartDateTime:HH:mm} - {appointment.EndDateTime:HH:mm}</td></tr>
            <tr><td><b>Google Meet:</b></td><td><a href='{meetLink}' style='color:#2a9d8f;'>{meetLink}</a></td></tr>
        </table>
        <p style='margin-top:20px;'>Please prepare for your session.<br/>--<br/>DrugUsePrevention Team</p>
    </div>";
        }

    }
}