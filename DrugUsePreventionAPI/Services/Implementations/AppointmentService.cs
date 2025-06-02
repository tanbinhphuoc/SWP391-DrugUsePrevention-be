using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Distributed;
using SendGrid;
using SendGrid.Helpers.Mail;
using Serilog;
using System.Text.Json;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class AppointmentService : IAppointmentService
    {
        private readonly ApplicationDbContext _context;
        private readonly IConfiguration _configuration; 
        private readonly IDistributedCache _cache;

        public AppointmentService(ApplicationDbContext context, IConfiguration configuration, IDistributedCache cache)
        {
            _context = context;
            _configuration = configuration;
            _cache = cache;
        }

        public async Task<IEnumerable<ConsultantDto>> GetAvailableConsultantsAsync()
        {
            var cacheKey = "consultants_active";
            var cachedData = await _cache.GetStringAsync(cacheKey);

            if (!string.IsNullOrEmpty(cachedData))
            {
                Log.Information("Returning cached consultants list");
                return JsonSerializer.Deserialize<IEnumerable<ConsultantDto>>(cachedData);
            }

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

            await _cache.SetStringAsync(cacheKey, JsonSerializer.Serialize(consultants), new DistributedCacheEntryOptions
            {
                AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(30)
            });

            Log.Information("Cached consultants list for 30 minutes");
            return consultants;
        }

        public async Task<IEnumerable<ConsultantScheduleDto>> GetConsultantSchedulesAsync(int consultantId, DateTime startDate, DateTime endDate)
        {
            var cacheKey = $"schedules_{consultantId}_{startDate:yyyyMMdd}_{endDate:yyyyMMdd}";
            var cachedData = await _cache.GetStringAsync(cacheKey);

            if (!string.IsNullOrEmpty(cachedData))
            {
                Log.Information("Returning cached schedules for consultant {ConsultantId}", consultantId);
                return JsonSerializer.Deserialize<IEnumerable<ConsultantScheduleDto>>(cachedData);
            }

            var schedules = await _context.ConsultantSchedules
                .Where(s => s.ConsultantID == consultantId
                    && s.Date >= startDate
                    && s.Date <= endDate
                    && s.IsAvailable)
                .Select(s => new ConsultantScheduleDto
                {
                    ScheduleID = s.ScheduleID,
                    DayOfWeek = s.DayOfWeek,
                    Date = s.Date,
                    StartTime = s.StartTime,
                    EndTime = s.EndTime,
                    Notes = s.Notes
                })
                .OrderBy(s => s.Date)
                .ThenBy(s => s.StartTime)
                .ToListAsync();

            await _cache.SetStringAsync(cacheKey, JsonSerializer.Serialize(schedules), new DistributedCacheEntryOptions
            {
                AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(15)
            });

            Log.Information("Cached schedules for consultant {ConsultantId} for 15 minutes", consultantId);
            return schedules;
        }

        public async Task<AppointmentDto> BookAppointmentAsync(BookAppointmentDto bookDto, int userId)
        {
            try
            {
                // Validate consultant
                var consultant = await _context.Consultants
                    .Include(c => c.User)
                    .FirstOrDefaultAsync(c => c.ConsultantID == bookDto.ConsultantID);
                if (consultant == null)
                    throw new InvalidOperationException("Consultant not found.");

                // Validate schedules
                var schedules = await _context.ConsultantSchedules
                    .Where(s => bookDto.ScheduleIDs.Contains(s.ScheduleID) && s.IsAvailable)
                    .OrderBy(s => s.Date)
                    .ThenBy(s => s.StartTime)
                    .ToListAsync();
                if (schedules.Count != bookDto.ScheduleIDs.Count)
                    throw new InvalidOperationException("One or more selected time slots are unavailable.");
                if (!AreSchedulesConsecutive(schedules))
                    throw new InvalidOperationException("Selected time slots must be consecutive.");

                // Validate 1-hour slots
                foreach (var schedule in schedules)
                {
                    var duration = schedule.EndTime - schedule.StartTime;
                    if (duration != TimeSpan.FromHours(1))
                        throw new InvalidOperationException("Each time slot must be exactly 1 hour.");
                }

                // Calculate appointment details
                var startDateTime = schedules.First().Date.Add(schedules.First().StartTime);
                var endDateTime = schedules.Last().Date.Add(schedules.Last().EndTime);
                var durationHours = schedules.Count;
                var price = (decimal)durationHours * consultant.HourlyRate;

                // Generate placeholder Google Meet link
                var googleMeetLink = $"https://meet.google.com/xxx-yyyy-zzz?appointmentId={Guid.NewGuid()}";

                // Create appointment
                var appointment = new Appointment
                {
                    UserID = userId,
                    ConsultantID = consultant.ConsultantID,
                    StartDateTime = startDateTime,
                    EndDateTime = endDateTime,
                    GoogleMeetLink = googleMeetLink,
                    Price = price,
                    Status = "PENDING_PAYMENT",
                    Note = bookDto.Note,
                    CreatedAt = DateTime.UtcNow,
                    UpdatedAt = DateTime.UtcNow
                };

                _context.Appointments.Add(appointment);

                // Mark schedules as unavailable
                foreach (var schedule in schedules)
                    schedule.IsAvailable = false;

                // Create payment record
                var payment = new Payment
                {
                    UserID = userId,
                    AppointmentID = appointment.AppointmentID,
                    Amount = price,
                    PaymentDate = DateTime.UtcNow,
                    PaymentMethod = bookDto.PaymentMethod,
                    Status = "PENDING",
                    TransactionID = Guid.NewGuid().ToString()
                };

                _context.Payments.Add(payment);
                await _context.SaveChangesAsync();

                // Invalidate cache
                await _cache.RemoveAsync($"schedules_{consultant.ConsultantID}_{startDateTime:yyyyMMdd}_{endDateTime:yyyyMMdd}");

                Log.Information("Appointment booked: AppointmentID={AppointmentID}, UserID={UserID}, ConsultantID={ConsultantID}",
                    appointment.AppointmentID, userId, consultant.ConsultantID);

                return new AppointmentDto
                {
                    AppointmentID = appointment.AppointmentID,
                    ConsultantName = consultant.User.FullName,
                    MemberName = (await _context.Users.FindAsync(userId)).FullName,
                    StartDateTime = appointment.StartDateTime,
                    EndDateTime = appointment.EndDateTime,
                    GoogleMeetLink = null, // Hidden until confirmed
                    Price = appointment.Price,
                    Status = appointment.Status,
                    Note = appointment.Note
                };
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error booking appointment for UserID={UserID}, ConsultantID={ConsultantID}", userId, bookDto.ConsultantID);
                throw;
            }
        }

        public async Task<AppointmentDto> ConfirmPaymentAsync(int appointmentId, string transactionId)
        {
            try
            {
                var appointment = await _context.Appointments
                    .Include(a => a.Consultant)
                    .ThenInclude(c => c.User)
                    .Include(a => a.User)
                    .FirstOrDefaultAsync(a => a.AppointmentID == appointmentId);
                if (appointment == null)
                    throw new InvalidOperationException("Appointment not found.");

                var payment = await _context.Payments
                    .FirstOrDefaultAsync(p => p.AppointmentID == appointmentId && p.TransactionID == transactionId);
                if (payment == null)
                    throw new InvalidOperationException("Payment not found.");

                if (appointment.Status != "PENDING_PAYMENT" || payment.Status != "PENDING")
                    throw new InvalidOperationException("Invalid appointment or payment status.");

                // Update statuses
                appointment.Status = "CONFIRMED";
                appointment.UpdatedAt = DateTime.UtcNow;
                payment.Status = "SUCCESS";
                payment.PaymentDate = DateTime.UtcNow;

                await _context.SaveChangesAsync();

                // Send email notifications
                await SendAppointmentConfirmationEmail(appointment);

                Log.Information("Payment confirmed: AppointmentID={AppointmentID}, TransactionID={TransactionID}",
                    appointment.AppointmentID, transactionId);

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
                    .Include(a => a.Consultant)
                    .ThenInclude(c => c.User)
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
                var appointments = await _context.Appointments
                    .Include(a => a.User)
                    .Include(a => a.Consultant)
                    .ThenInclude(c => c.User)
                    .Where(a => a.ConsultantID == consultantId && a.Status == "CONFIRMED")
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

                Log.Information("Retrieved {Count} appointments for ConsultantID={ConsultantID}", appointments.Count, consultantId);
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

        private async Task SendAppointmentConfirmationEmail(Appointment appointment)
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

                // Send to member
                await SendEmailAsync(memberEmail, subject, body);
                // Send to consultant
                await SendEmailAsync(consultantEmail, subject, body);

                Log.Information("Sent confirmation emails for AppointmentID={AppointmentID}", appointment.AppointmentID);
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error sending confirmation email for AppointmentID={AppointmentID}", appointment.AppointmentID);
                throw new InvalidOperationException("Failed to send confirmation email.", ex);
            }
        }

        private async Task SendEmailAsync(string toEmail, string subject, string body)
        {
            var client = new SendGridClient(_configuration["SendGrid:ApiKey"]);
            var from = new EmailAddress("no-reply@drugprevention.org", "Drug Prevention System");
            var to = new EmailAddress(toEmail);
            var msg = MailHelper.CreateSingleEmail(from, to, subject, body, body);
            var response = await client.SendEmailAsync(msg);

            if (response.StatusCode != System.Net.HttpStatusCode.Accepted)
            {
                Log.Error("SendGrid failed to send email to {ToEmail}. Status: {StatusCode}", toEmail, response.StatusCode);
                throw new InvalidOperationException("Failed to send email.");
            }
        }
    }
}

