using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.Extensions.Configuration;
using Serilog;
using System.Net.Mail;
using System.Net;
using Hangfire;
using AutoMapper;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class AppointmentService : IAppointmentService
    {
        private readonly IUnitOfWork _unitOfWork; private readonly IConfiguration _configuration; private readonly VNPayHelper _vnpayHelper; private readonly IMapper _mapper;

        public AppointmentService(IUnitOfWork unitOfWork, IConfiguration configuration, VNPayHelper vnpayHelper, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _configuration = configuration;
            _vnpayHelper = vnpayHelper;
            _mapper = mapper;
        }

        public async Task<IEnumerable<ConsultantDto>> GetAvailableConsultantsAsync()
        {
            var consultants = await _unitOfWork.Consultants.GetActiveConsultantsAsync();
            var consultantDtos = consultants.Select(c => _mapper.Map<ConsultantDto>(c)).ToList();

            Log.Information("Retrieved {Count} consultants from database", consultantDtos.Count);
            return consultantDtos;
        }

        public async Task<IEnumerable<ConsultantScheduleDto>> GetConsultantSchedulesAsync(int consultantId, DateTime startDate, DateTime endDate)
        {
            try
            {
                var consultant = await _unitOfWork.Consultants.GetByIdAsync(consultantId);
                if (consultant == null)
                {
                    throw new InvalidOperationException("Consultant not found.");
                }

                var schedules = await _unitOfWork.ConsultantSchedules.GetSchedulesByConsultantAndDateRangeAsync(consultantId, startDate, endDate);
                if (!schedules.Any())
                {
                    throw new InvalidOperationException("No available schedules for the specified dates.");
                }

                return schedules.Select(s => _mapper.Map<ConsultantScheduleDto>(s)).ToList();
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving schedules for ConsultantID={ConsultantId}", consultantId);
                throw;
            }
        }

        public async Task<(AppointmentDto appointment, string paymentUrl)> BookAppointmentAsync(BookAppointmentDto bookDto, int userId)
        {
            try
            {
                Log.Information("Booking appointment: ConsultantID={ConsultantID}, ScheduleIDs={ScheduleIDs}, UserID={UserID}",
                    bookDto.ConsultantID, string.Join(",", bookDto.ScheduleIDs), userId);

                var consultant = await _unitOfWork.Consultants.GetConsultantWithUserAndCertificateAsync(bookDto.ConsultantID);
                if (consultant == null)
                {
                    Log.Error("Consultant not found for ConsultantID={ConsultantID}", bookDto.ConsultantID);
                    throw new InvalidOperationException("Consultant not found.");
                }
                Log.Information("Consultant found: {ConsultantID}", consultant.ConsultantID);

                var schedules = await _unitOfWork.ConsultantSchedules.FindAsync(s => bookDto.ScheduleIDs.Contains(s.ScheduleID) && s.IsAvailable);
                schedules = schedules.OrderBy(s => s.Date).ThenBy(s => s.StartTime).ToList();
                Log.Information("Found schedules: {Schedules}", string.Join(",", schedules.Select(s => s.ScheduleID)));

                if (schedules.Count() != bookDto.ScheduleIDs.Count)
                {
                    throw new InvalidOperationException("One or more selected time slots are unavailable.");
                }

                if (!AreSchedulesConsecutive(schedules.ToList()))
                {
                    throw new InvalidOperationException("Selected time slots must be consecutive.");
                }

                foreach (var schedule in schedules)
                {
                    var duration = schedule.EndTime - schedule.StartTime;
                    if (duration != TimeSpan.FromHours(1))
                    {
                        throw new InvalidOperationException("Each time slot must be exactly 1 hour.");
                    }

                    var currentDateTime = DateTime.Now;
                    var scheduleStartTime = schedule.Date.Add(schedule.StartTime);
                    var todayMorning = currentDateTime.Date.AddHours(7);
                    var maxFutureDate = currentDateTime.Date.AddDays(30);

                    if (scheduleStartTime < currentDateTime && schedule.Date == currentDateTime.Date)
                    {
                        throw new InvalidOperationException("Cannot book a past time slot for today.");
                    }
                    if (schedule.Date == currentDateTime.Date && scheduleStartTime < todayMorning)
                    {
                        throw new InvalidOperationException("Appointments can only be booked from 7:00 AM today.");
                    }
                    if (schedule.Date > maxFutureDate)
                    {
                        throw new InvalidOperationException("Cannot book more than 30 days in the future.");
                    }
                }

                var startDateTime = schedules.First().Date.Add(schedules.First().StartTime);
                var endDateTime = schedules.Last().Date.Add(schedules.Last().EndTime);
                var durationHours = schedules.Count();
                var price = (decimal)durationHours * consultant.HourlyRate;

                var appointment = new Appointment
                {
                    UserID = userId,
                    ConsultantID = consultant.ConsultantID,
                    StartDateTime = startDateTime,
                    EndDateTime = endDateTime,
                    GoogleMeetLink = null,
                    Price = price,
                    Status = "PENDING_PAYMENT",
                    Note = bookDto.Note,
                    CreatedAt = DateTime.UtcNow,
                    UpdatedAt = DateTime.UtcNow
                };

                await _unitOfWork.Appointments.AddAsync(appointment);
                await _unitOfWork.SaveChangesAsync();

                foreach (var schedule in schedules)
                    schedule.IsAvailable = false;

                _unitOfWork.ConsultantSchedules.UpdateRange(schedules);

                var payment = new Payment
                {
                    UserID = userId,
                    AppointmentID = appointment.AppointmentID,
                    Amount = price,
                    PaymentDate = null,
                    PaymentMethod = bookDto.PaymentMethod,
                    Status = "PENDING",
                    TransactionID = $"{appointment.AppointmentID}-{Guid.NewGuid().ToString()}"
                };
                // kiểm tra payment date nếu trạng thái là PENDING
                if (payment.PaymentDate == null && payment.Status == "PENDING")
                {
                    // nếu trạng thái là PENDING thì đặt payment date là thời gian hiện tại
                    payment.PaymentDate = DateTime.UtcNow; // Set payment date to now if it's pending
                }

                await _unitOfWork.Payments.AddAsync(payment);
                await _unitOfWork.SaveChangesAsync();

                var paymentUrl = _vnpayHelper.CreatePaymentUrl(payment, $"Thanh toan cuoc hen ID {appointment.AppointmentID}");

                Log.Information("Appointment booked: AppointmentID={AppointmentID}, UserID={UserID}, ConsultantID={ConsultantID}",
                    appointment.AppointmentID, userId, consultant.ConsultantID);

                var user = await _unitOfWork.Users.GetByIdAsync(userId);
                return (
                    new AppointmentDto
                    {
                        AppointmentID = appointment.AppointmentID,
                        ConsultantName = consultant.User.FullName,
                        MemberName = user.FullName,
                        StartDateTime = appointment.StartDateTime,
                        EndDateTime = appointment.EndDateTime,
                        GoogleMeetLink = null,
                        Price = appointment.Price,
                        Status = appointment.Status,
                        Note = appointment.Note
                    },
                    paymentUrl
                );
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error booking appointment for UserID={UserID}, ConsultantID={ConsultantID}", userId, bookDto.ConsultantID);
                throw;
            }
        }

        public async Task<AppointmentDto> ConfirmPaymentAsync(int appointmentId, string transactionId, string vnpayResponseCode)
        {
            try
            {
                Log.Information("Confirming payment: AppointmentID={AppointmentID}, TransactionID={TransactionID}", appointmentId, transactionId);

                var appointment = await _unitOfWork.Appointments.GetAppointmentWithDetailsAsync(appointmentId);
                if (appointment == null || appointment.Status != "PENDING_PAYMENT")
                {
                    Log.Error("Invalid appointment status for payment confirmation: AppointmentID={AppointmentID}", appointmentId);
                    throw new InvalidOperationException("Invalid appointment status for payment confirmation.");
                }

                var payment = await _unitOfWork.Payments.GetByAppointmentAndTransactionAsync(appointmentId, transactionId);
                if (payment == null || payment.Status != "PENDING")
                {
                    Log.Error("Invalid payment details for AppointmentID={AppointmentID}, TransactionID={TransactionID}", appointmentId, transactionId);
                    throw new InvalidOperationException("Invalid payment details.");
                }

                switch (vnpayResponseCode)
                {
                    case "00":
                        payment.Status = "SUCCESS";
                        payment.PaymentDate = DateTime.UtcNow;
                        appointment.Status = "CONFIRMED";
                        appointment.GoogleMeetLink = $"https://meet.google.com/new?appointmentId={Guid.NewGuid()}";
                        break;
                    case "24":
                        payment.Status = "CANCELED";
                        appointment.Status = "CANCELED";
                        await CancelAppointmentSchedules(appointmentId);
                        await SendPaymentErrorEmail(appointment, "Payment was canceled by user.");
                        break;
                    case "11":
                        payment.Status = "SUSPENDED";
                        await SendPaymentErrorEmail(appointment, "Payment is suspended. Please contact support.");
                        break;
                    default:
                        payment.Status = "ERROR";
                        await SendPaymentErrorEmail(appointment, $"Payment failed with error code {vnpayResponseCode}.");
                        break;
                }

                _unitOfWork.Payments.Update(payment);
                _unitOfWork.Appointments.Update(appointment);
                await _unitOfWork.SaveChangesAsync();

                if (payment.Status == "SUCCESS")
                {
                    await SendAppointmentConfirmationGmail(appointment);
                    ScheduleReminder(appointment);
                }

                Log.Information("Payment confirmed: AppointmentID={AppointmentID}, TransactionID={TransactionID}", appointmentId, transactionId);
                return _mapper.Map<AppointmentDto>(appointment);
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error confirming payment for AppointmentID={AppointmentID}", appointmentId);
                throw;
            }
        }

        public async Task<IEnumerable<AppointmentDto>> GetUserAppointmentsAsync(int userId)
        {
            try
            {
                var appointments = await _unitOfWork.Appointments.GetAppointmentsByUserAsync(userId);
                var appointmentDtos = appointments.Select(a => new AppointmentDto
                {
                    AppointmentID = a.AppointmentID,
                    ConsultantName = a.Consultant.User.FullName,
                    MemberName = a.User.FullName,
                    StartDateTime = a.StartDateTime,
                    EndDateTime = a.EndDateTime,
                    GoogleMeetLink = a.Status == "CONFIRMED" ? a.GoogleMeetLink : null,
                    Price = a.Price,
                    Status = a.Status,
                    Note = a.Note
                }).ToList();

                Log.Information("Retrieved {Count} appointments for UserID={UserID}", appointmentDtos.Count, userId);
                return appointmentDtos;
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving appointments for UserID={UserID}", userId);
                throw;
            }
        }

        public async Task<IEnumerable<AppointmentDto>> GetConsultantAppointmentsAsync(int consultantId)
        {
            try
            {
                var appointments = await _unitOfWork.Appointments.GetAppointmentsByConsultantAsync(consultantId);
                var appointmentDtos = appointments.Select(a => new AppointmentDto
                {
                    AppointmentID = a.AppointmentID,
                    MemberName = a.User.FullName,
                    ConsultantName = a.Consultant.User.FullName,
                    StartDateTime = a.StartDateTime,
                    EndDateTime = a.EndDateTime,
                    GoogleMeetLink = a.GoogleMeetLink,
                    Price = a.Price,
                    Status = a.Status,
                    Note = a.Note
                }).ToList();

                Log.Information("Retrieved {Count} upcoming appointments for ConsultantID={ConsultantID}", appointmentDtos.Count, consultantId);
                return appointmentDtos;
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving appointments for ConsultantID={ConsultantID}", consultantId);
                throw;
            }
        }

        private bool AreSchedulesConsecutive(List<ConsultantSchedule> schedules)
        {
            if (schedules.Count <= 1) return true;
            schedules = schedules.OrderBy(s => s.Date).ThenBy(s => s.StartTime).ToList();
            for (int i = 1; i < schedules.Count; i++)
            {
                var prevEnd = schedules[i - 1].Date.Add(schedules[i - 1].EndTime);
                var currStart = schedules[i].Date.Add(schedules[i].StartTime);
                if (prevEnd != currStart)
                    return false;
            }
            return true;
        }

        private async Task SendAppointmentConfirmationGmail(Appointment appointment)
        {
            try
            {
                var memberEmail = appointment.User.Email;
                var consultantEmail = appointment.Consultant.User.Email;
                var subject = "Appointment Confirmation - Drug Prevention System";
                var body = $@"Your appointment has been successfully confirmed!
        Details:
        - Consultant: {appointment.Consultant.User.FullName}
        - Member: {appointment.User.FullName}
        - Date/Time: {appointment.StartDateTime:yyyy-MM-dd HH:mm} to {appointment.EndDateTime:HH:mm}
        - Google Meet Link: {appointment.GoogleMeetLink}
        - Note: {appointment.Note ?? "None"}
        Please join the meeting at the scheduled time.";

                await SendGmailAsync(memberEmail, subject, body);
                await SendGmailAsync(consultantEmail, subject, body);

                Log.Information("Sent confirmation emails for AppointmentID={AppointmentID}", appointment.AppointmentID);
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error sending confirmation email for AppointmentID={AppointmentID}", appointment.AppointmentID);
                throw new InvalidOperationException("Failed to send confirmation email.", ex);
            }
        }

        private async Task SendPaymentErrorEmail(Appointment appointment, string errorMessage)
        {
            try
            {
                var memberEmail = appointment.User.Email;
                var subject = "Payment Issue - Drug Prevention System";
                var body = $@"There was an issue with your payment for the appointment.
        Details:
        - Consultant: {appointment.Consultant.User.FullName}
        - Member: {appointment.User.FullName}
        - Date/Time: {appointment.StartDateTime:yyyy-MM-dd HH:mm} to {appointment.EndDateTime:HH:mm}
        - Error: {errorMessage}
        Please try again or contact support.";

                await SendGmailAsync(memberEmail, subject, body);
                Log.Information("Sent payment error email for AppointmentID={AppointmentID}", appointment.AppointmentID);
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error sending payment error email for AppointmentID={AppointmentID}", appointment.AppointmentID);
                throw new InvalidOperationException("Failed to send payment error email.", ex);
            }
        }

        private async Task SendGmailAsync(string toEmail, string subject, string body)
        {
            var gmailConfig = _configuration.GetSection("Gmail");
            var email = gmailConfig["Email"];
            var password = gmailConfig["Password"];
            var host = gmailConfig["Host"];
            var port = int.Parse(gmailConfig["Port"]);
            var enableSsl = bool.Parse(gmailConfig["EnableSsl"]);

            using (var client = new SmtpClient(host, port))
            {
                client.Credentials = new NetworkCredential(email, password);
                client.EnableSsl = enableSsl;

                var mailMessage = new MailMessage
                {
                    From = new MailAddress(email, "Drug Prevention System"),
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = false
                };
                mailMessage.To.Add(toEmail);

                try
                {
                    await client.SendMailAsync(mailMessage);
                    Log.Information("Email sent successfully to {ToEmail}", toEmail);
                }
                catch (Exception ex)
                {
                    Log.Error("Failed to send email to {ToEmail}. Error: {Error}", toEmail, ex.Message);
                    throw new InvalidOperationException("Failed to send email.", ex);
                }
            }
        }

        private async Task CancelAppointmentSchedules(int appointmentId)
        {
            var appointment = await _unitOfWork.Appointments.GetByIdAsync(appointmentId);
            if (appointment != null)
            {
                var schedules = await _unitOfWork.ConsultantSchedules.GetSchedulesByAppointmentAsync(
                    appointment.ConsultantID,
                    appointment.StartDateTime,
                    appointment.EndDateTime);

                foreach (var schedule in schedules)
                    schedule.IsAvailable = true;

                _unitOfWork.ConsultantSchedules.UpdateRange(schedules);
                await _unitOfWork.SaveChangesAsync();
            }
        }

        private void ScheduleReminder(Appointment appointment)
        {
            var reminderTime = appointment.StartDateTime.AddHours(-1);
            if (reminderTime > DateTime.UtcNow)
            {
                BackgroundJob.Schedule(() => SendReminderEmail(appointment.AppointmentID), reminderTime.ToUniversalTime());
            }
        }

        [AutomaticRetry(Attempts = 0)]
        public async Task SendReminderEmail(int appointmentId)
        {
            var appointment = await _unitOfWork.Appointments.GetAppointmentWithDetailsAsync(appointmentId);
            if (appointment == null)
            {
                Log.Error("Appointment not found for reminder: AppointmentID={AppointmentID}", appointmentId);
                return;
            }

            var memberEmail = appointment.User.Email;
            var consultantEmail = appointment.Consultant.User.Email;
            var subject = "Appointment Reminder - Drug Prevention System";
            var body = $@"This is a reminder for your upcoming appointment!
    Details:
    - Consultant: {appointment.Consultant.User.FullName}
    - Member: {appointment.User.FullName}
    - Date/Time: {appointment.StartDateTime:yyyy-MM-dd HH:mm} to {appointment.EndDateTime:HH:mm}
    - Google Meet Link: {appointment.GoogleMeetLink}
    - Note: {appointment.Note ?? "None"}
    Please join the meeting 1 hour from now.";

            await SendGmailAsync(memberEmail, subject, body);
            await SendGmailAsync(consultantEmail, subject, body);

            Log.Information("Sent reminder emails for AppointmentID={AppointmentID}", appointmentId);
        }
    }

}