using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.EntityFrameworkCore;
using Serilog;
using System.Net.Mail;
using System.Net;
using Hangfire;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class AppointmentService : IAppointmentService
    {
        private readonly ApplicationDbContext _context;
        private readonly IConfiguration _configuration;
        private readonly VNPayHelper _vnpayHelper;

        public AppointmentService(ApplicationDbContext context, IConfiguration configuration, VNPayHelper vnpayHelper)
        {
            _context = context;
            _configuration = configuration;
            _vnpayHelper = vnpayHelper;
        }

        public async Task<IEnumerable<ConsultantDto>> GetAvailableConsultantsAsync()
        {
            var consultants = await _context.Consultants
                .Include(c => c.User)
                .Include(c => c.Certificate)
                .Where(c => c.User.Status == "Active")
                .Select(c => new ConsultantDto
                {
                    ConsultantID = c.ConsultantID,
                    FullName = c.User.FullName,
                    Email = c.User.Email,
                    Specialty = c.Specialty,
                    Degree = c.Degree,
                    HourlyRate = c.HourlyRate,
                    CertificateName = c.Certificate != null ? c.Certificate.CertificateName : null
                })
                .ToListAsync();

            Log.Information("Retrieved {Count} consultants from database", consultants.Count);
            return consultants;
        }

        public async Task<IEnumerable<ConsultantScheduleDto>> GetConsultantSchedulesAsync(int consultantId, DateTime startDate, DateTime endDate)
        {
            try
            {
                var consultant = await _context.Consultants.FirstOrDefaultAsync(c => c.ConsultantID == consultantId);
                if (consultant == null)
                {
                    throw new InvalidOperationException("Consultant not found.");
                }

                var schedules = await _context.ConsultantSchedules
                    .Where(s => s.ConsultantID == consultantId && s.Date >= startDate && s.Date <= endDate)
                    .Select(s => new ConsultantScheduleDto
                    {
                        ScheduleID = s.ScheduleID,
                        DayOfWeek = s.DayOfWeek,
                        Date = s.Date,
                        StartTime = s.StartTime,
                        EndTime = s.EndTime,
                        Notes = s.Notes
                    })
                    .ToListAsync();

                if (schedules.Count == 0)
                {
                    throw new InvalidOperationException("No available schedules for the specified dates.");
                }

                return schedules;
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

                var consultant = await _context.Consultants
                    .Include(c => c.User)
                    .FirstOrDefaultAsync(c => c.ConsultantID == bookDto.ConsultantID);
                if (consultant == null)
                {
                    Log.Error("Consultant not found for ConsultantID={ConsultantID}", bookDto.ConsultantID);
                    throw new InvalidOperationException("Consultant not found.");
                }
                Log.Information("Consultant found: {ConsultantID}", consultant.ConsultantID);

                var schedules = await _context.ConsultantSchedules
                    .Where(s => bookDto.ScheduleIDs.Contains(s.ScheduleID) && s.IsAvailable)
                    .OrderBy(s => s.Date)
                    .ThenBy(s => s.StartTime)
                    .ToListAsync();
                Log.Information("Found schedules: {Schedules}", string.Join(",", schedules.Select(s => s.ScheduleID)));

                if (schedules.Count != bookDto.ScheduleIDs.Count)
                {
                    throw new InvalidOperationException("One or more selected time slots are unavailable.");
                }

                if (!AreSchedulesConsecutive(schedules))
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
                var durationHours = schedules.Count;
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

                _context.Appointments.Add(appointment);
                await _context.SaveChangesAsync();

                foreach (var schedule in schedules)
                    schedule.IsAvailable = false;

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

                _context.Payments.Add(payment);
                await _context.SaveChangesAsync();

                var paymentUrl = _vnpayHelper.CreatePaymentUrl(payment, $"Thanh toan cuoc hen ID {appointment.AppointmentID}");

                Log.Information("Appointment booked: AppointmentID={AppointmentID}, UserID={UserID}, ConsultantID={ConsultantID}",
                    appointment.AppointmentID, userId, consultant.ConsultantID);

                return (
                    new AppointmentDto
                    {
                        AppointmentID = appointment.AppointmentID,
                        ConsultantName = consultant.User.FullName,
                        MemberName = (await _context.Users.FindAsync(userId)).FullName,
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

                var appointment = await _context.Appointments
                    .Include(a => a.Consultant).ThenInclude(c => c.User)
                    .Include(a => a.User)
                    .FirstOrDefaultAsync(a => a.AppointmentID == appointmentId);
                if (appointment == null || appointment.Status != "PENDING_PAYMENT")
                {
                    Log.Error("Invalid appointment status for payment confirmation: AppointmentID={AppointmentID}", appointmentId);
                    throw new InvalidOperationException("Invalid appointment status for payment confirmation.");
                }

                var payment = await _context.Payments
                    .FirstOrDefaultAsync(p => p.AppointmentID == appointmentId && p.TransactionID == transactionId);
                if (payment == null || payment.Status != "PENDING")
                {
                    Log.Error("Invalid payment details for AppointmentID={AppointmentID}, TransactionID={TransactionID}", appointmentId, transactionId);
                    throw new InvalidOperationException("Invalid payment details.");
                }

                // Xử lý trạng thái từ VNPay
                switch (vnpayResponseCode)
                {
                    case "00": // Thanh toán thành công
                        payment.Status = "SUCCESS";
                        payment.PaymentDate = DateTime.UtcNow;
                        appointment.Status = "CONFIRMED";
                        appointment.GoogleMeetLink = $"https://meet.google.com/new?appointmentId={Guid.NewGuid()}";
                        break;
                    case "24": // Khách hàng hủy giao dịch
                        payment.Status = "CANCELED";
                        appointment.Status = "CANCELED";
                        await CancelAppointmentSchedules(appointmentId);
                        await SendPaymentErrorEmail(appointment, "Payment was canceled by user.");
                        break;
                    case "11": // Giao dịch bị tạm hoãn
                        payment.Status = "SUSPENDED";
                        await SendPaymentErrorEmail(appointment, "Payment is suspended. Please contact support.");
                        break;
                    default: // Lỗi khác
                        payment.Status = "ERROR";
                        await SendPaymentErrorEmail(appointment, $"Payment failed with error code {vnpayResponseCode}.");
                        break;
                }

                await _context.SaveChangesAsync();

                if (payment.Status == "SUCCESS")
                {
                    await SendAppointmentConfirmationGmail(appointment);
                    ScheduleReminder(appointment);
                }

                Log.Information("Payment confirmed: AppointmentID={AppointmentID}, TransactionID={TransactionID}", appointmentId, transactionId);
                return new AppointmentDto
                {
                    AppointmentID = appointment.AppointmentID,
                    ConsultantName = appointment.Consultant.User.FullName,
                    MemberName = appointment.User.FullName,
                    StartDateTime = appointment.StartDateTime,
                    EndDateTime = appointment.EndDateTime,
                    GoogleMeetLink = appointment.GoogleMeetLink,
                    Price = appointment.Price,
                    Status = appointment.Status,
                    Note = appointment.Note
                };
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
                var appointments = await _context.Appointments
                    .Include(a => a.Consultant).ThenInclude(c => c.User)
                    .Include(a => a.User)
                    .Where(a => a.UserID == userId)
                    .Select(a => new AppointmentDto
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
                    })
                    .ToListAsync();

                Log.Information("Retrieved {Count} appointments for UserID={UserID}", appointments.Count, userId);
                return appointments;
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
                var currentDateTime = DateTime.Now;
                var appointments = await _context.Appointments
                    .Include(a => a.User)
                    .Include(a => a.Consultant).ThenInclude(c => c.User)
                    .Where(a => a.ConsultantID == consultantId && a.Status == "CONFIRMED" && a.StartDateTime > currentDateTime)
                    .OrderBy(a => a.StartDateTime)
                    .Select(a => new AppointmentDto
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
                    })
                    .ToListAsync();

                Log.Information("Retrieved {Count} upcoming appointments for ConsultantID={ConsultantID}", appointments.Count, consultantId);
                return appointments;
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
            var appointment = await _context.Appointments.FindAsync(appointmentId);
            if (appointment != null)
            {
                var schedules = await _context.ConsultantSchedules
                    .Where(s => s.ConsultantID == appointment.ConsultantID &&
                                s.Date >= appointment.StartDateTime.Date &&
                                s.Date <= appointment.EndDateTime.Date &&
                                s.StartTime >= appointment.StartDateTime.TimeOfDay &&
                                s.EndTime <= appointment.EndDateTime.TimeOfDay)
                    .ToListAsync();
                foreach (var schedule in schedules)
                    schedule.IsAvailable = true;

                await _context.SaveChangesAsync();
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
            var appointment = await _context.Appointments
                .Include(a => a.Consultant).ThenInclude(c => c.User)
                .Include(a => a.User)
                .FirstOrDefaultAsync(a => a.AppointmentID == appointmentId);

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