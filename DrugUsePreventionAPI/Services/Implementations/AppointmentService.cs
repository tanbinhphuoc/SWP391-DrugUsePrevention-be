using AutoMapper;
using DrugUsePreventionAPI.Configurations;
using DrugUsePreventionAPI.Exceptions;
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

        public AppointmentService(
            IUnitOfWork unitOfWork,
            IMapper mapper,
            VNPayHelper vnPayHelper,
            IOptions<GmailSettings> gmailSettings)
        {
            _unitOfWork = unitOfWork ?? throw new ArgumentNullException(nameof(unitOfWork));
            _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
            _vnPayHelper = vnPayHelper ?? throw new ArgumentNullException(nameof(vnPayHelper));
            _gmailSettings = gmailSettings.Value ?? throw new ArgumentNullException(nameof(gmailSettings));
        }

        public async Task<IEnumerable<ConsultantDto>> GetAvailableConsultantsAsync()
        {
            Log.Information("Retrieving available consultants");
            var consultants = await _unitOfWork.Consultants.GetAvailableConsultantsAsync();
            var result = _mapper.Map<IEnumerable<ConsultantDto>>(consultants);
            Log.Information("Retrieved {Count} available consultants", result.Count());
            return result;
        }

        public async Task<IEnumerable<ConsultantScheduleDto>> GetConsultantSchedulesAsync(int consultantId, DateTime startDate, DateTime endDate)
        {
            Log.Information("Retrieving schedules for consultant {ConsultantId} from {StartDate} to {EndDate}", consultantId, startDate, endDate);
            var schedules = await _unitOfWork.ConsultantSchedules.GetSchedulesByConsultantAndDateRangeAsync(consultantId, startDate, endDate);
            var filteredSchedules = schedules.Where(s => s.IsAvailable).OrderBy(s => s.ScheduleID);
            var result = _mapper.Map<IEnumerable<ConsultantScheduleDto>>(filteredSchedules);
            Log.Information("Retrieved {Count} schedules", result.Count());
            return result;
        }

        public async Task<(AppointmentDto appointment, string paymentUrl)> BookAppointmentAsync(BookAppointmentDto bookDto, int userId, HttpContext context = null)
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

            var paymentUrl = _vnPayHelper.CreatePaymentUrl(payment, $"Appointment {appointment.AppointmentID} for {durationHours} hours", null, context);
            var appointmentDto = _mapper.Map<AppointmentDto>(appointment);

            Log.Information("Appointment {AppointmentId} created with payment URL", appointment.AppointmentID);
            return (appointmentDto, paymentUrl);
        }

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

            payment.Status = "SUCCESS";
            payment.RetryCount = 0;
            appointment.Status = "CONFIRMED";

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
            var subjectMember = $"Appointment Confirmation - {appointment.StartDateTime:dd/MM/yyyy HH:mm}";
            var bodyMember = $@"Dear {member.FullName},
Your appointment with {consultant.User.FullName} has been confirmed.
Details:
- Date: {appointment.StartDateTime:dd/MM/yyyy}
- Time: {appointment.StartDateTime:HH:mm} - {appointment.EndDateTime:HH:mm}
- Google Meet: {meetLink}
- Price: {appointment.Price} VND
Thank you for using our service!";
            SendEmail(member.Email, subjectMember, bodyMember);

            var subjectConsultant = $"New Appointment Notification - {appointment.StartDateTime:dd/MM/yyyy HH:mm}";
            var bodyConsultant = $@"Dear {consultant.User.FullName},
You have a new confirmed appointment.
Details:
- Client: {member.FullName}
- Date: {appointment.StartDateTime:dd/MM/yyyy}
- Time: {appointment.StartDateTime:HH:mm} - {appointment.EndDateTime:HH:mm}
- Google Meet: {meetLink}
Please prepare for the session.";
            SendEmail(consultant.User.Email, subjectConsultant, bodyConsultant);

            var appointmentDto = _mapper.Map<AppointmentDto>(appointment);
            Log.Information("Payment confirmed for appointment {AppointmentId}", appointmentId);
            return appointmentDto;

            void SendEmail(string toEmail, string subject, string body)
            {
                try
                {
                    using var smtpClient = new SmtpClient(_gmailSettings.Host, _gmailSettings.Port)
                    {
                        Credentials = new NetworkCredential(_gmailSettings.Email, _gmailSettings.Password),
                        EnableSsl = _gmailSettings.EnableSsl
                    };
                    var mail = new MailMessage(_gmailSettings.Email, toEmail, subject, body) { IsBodyHtml = false };
                    smtpClient.Send(mail);
                    Log.Information("Email sent to {ToEmail} for appointment {AppointmentId}", toEmail, appointmentId);
                }
                catch (Exception ex)
                {
                    Log.Error(ex, "Failed to send email to {ToEmail} for appointment {AppointmentId}", toEmail, appointmentId);
                }
            }
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
    }
}