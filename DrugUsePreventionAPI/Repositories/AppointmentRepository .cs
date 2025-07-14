using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Exceptions;
using DrugUsePreventionAPI.Models.DTOs.Admin;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories
{
    public class AppointmentRepository : GenericRepository<Appointment>, IAppointmentRepository
    {
        public AppointmentRepository(ApplicationDbContext context) : base(context) { }

        public async Task<bool> IsTimeSlotBookedAsync(int consultantId, DateTime startDateTime, DateTime endDateTime)
        {
            return await _context.Appointments
                .AsNoTracking()
                .AnyAsync(a => a.ConsultantID == consultantId &&
                              a.Status != "CANCELED" &&
                              ((a.StartDateTime <= startDateTime && a.EndDateTime > startDateTime) ||
                               (a.StartDateTime < endDateTime && a.EndDateTime >= endDateTime) ||
                               (a.StartDateTime >= startDateTime && a.EndDateTime <= endDateTime)));
        }

        public async Task<IEnumerable<Appointment>> GetByUserIdAsync(int userId)
        {
            return await _context.Appointments
         .Include(a => a.User)
         .Include(a => a.Consultant)
         .ThenInclude(c => c.User)
         .Where(a => a.UserID == userId)
         .ToListAsync();
        }

        public async Task<IEnumerable<Appointment>> GetByConsultantIdAsync(int consultantId)
        {
            return await _context.Appointments
         .Include(a => a.User)
         .Include(a => a.Consultant)
         .ThenInclude(c => c.User)
         .Where(a => a.ConsultantID == consultantId)
         .ToListAsync();
        }

        public async Task<Appointment> GetAppointmentWithDetailsAsync(int appointmentId)
        {
            /*
            var appointment = await _context.Appointments
                .AsNoTracking()
                .Include(a => a.User)
                .Include(a => a.Consultant)
                    .ThenInclude(c => c.User) // Đảm bảo tải User của Consultant
                .FirstOrDefaultAsync(a => a.AppointmentID == appointmentId);
            */
            var appointment = await _context.Appointments
    .Include(a => a.User)
    .Include(a => a.Consultant)
        .ThenInclude(c => c.User)
    .FirstOrDefaultAsync(a => a.AppointmentID == appointmentId);

            if (appointment == null)
            {
                Log.Warning("Appointment {AppointmentId} not found", appointmentId);
                throw new EntityNotFoundException("Appointment", appointmentId);
            }
            if (appointment.Consultant == null)
            {
                Log.Warning("Consultant not found for appointment {AppointmentId} with ConsultantID {ConsultantId}",
                    appointmentId, appointment.ConsultantID);
                throw new EntityNotFoundException("Consultant", appointment.ConsultantID);
            }
            return appointment;
        }

        public async Task<Payment> GetByAppointmentIdAsync(int appointmentId)
        {
            var payment = await _context.Payments
              .AsNoTracking()
              .Include(p => p.Appointment)
                  .ThenInclude(a => a.User)
              .Include(p => p.Appointment)
                  .ThenInclude(a => a.Consultant)
                      .ThenInclude(c => c.User)
              .FirstOrDefaultAsync(p => p.AppointmentID == appointmentId);

            if (payment == null)
            {
                Log.Warning("No payment found for appointment ID {AppointmentId}", appointmentId);
            }
            return payment;
        }

        public async Task UpdateAppointmentSchedulesAsync(int appointmentId, List<int> scheduleIds)
        {
            var appointment = await _context.Appointments.FindAsync(appointmentId);
            if (appointment == null)
            {
                Log.Warning("Appointment {AppointmentId} not found for updating schedules", appointmentId);
                throw new EntityNotFoundException("Appointment", appointmentId);
            }

            appointment.ScheduleIds = string.Join(",", scheduleIds);
            await _context.SaveChangesAsync();
        }

        public async Task<AppointmentStatDto> GetAppointmentStatisticsAsync(DateTime? startDate, DateTime? endDate)
        {
            Log.Information("Retrieving appointment statistics from {StartDate} to {EndDate}", startDate, endDate);

            var query = _context.Appointments.AsNoTracking();
            if (startDate.HasValue)
                query = query.Where(a => a.StartDateTime >= startDate.Value);
            if (endDate.HasValue)
                query = query.Where(a => a.EndDateTime <= endDate.Value);

            var totalAppointments = await query.CountAsync();
            var totalConfirmed = await query.CountAsync(a => a.Status == "CONFIRMED");
            var totalCancelled = await query.CountAsync(a => a.Status == "CANCELED");
            var totalPending = await query.CountAsync(a => a.Status == "PENDING_PAYMENT");

            var stats = new AppointmentStatDto
            {
                TotalAppointments = totalAppointments,
                TotalConfirmedAppointments = totalConfirmed,
                TotalCancelledAppointments = totalCancelled,
                TotalPendingAppointments = totalPending
            };

            Log.Information("Retrieved appointment statistics: Total={Total}, Confirmed={Confirmed}, Cancelled={Cancelled}, Pending={Pending}",
                totalAppointments, totalConfirmed, totalCancelled, totalPending);
            return stats;
        }


        public async Task<IEnumerable<Appointment>> GetAllAppointmentsAsync()
        {
            Log.Information("Retrieving all appointments");

            var items = await _context.Appointments
                .AsNoTracking()
                .Include(a => a.User)
                .Include(a => a.Consultant)
                .ThenInclude(c => c.User)
                .Include(a => a.Payments)
                .OrderByDescending(a => a.StartDateTime)
                .ToListAsync();

            Log.Information("Retrieved {Count} appointments", items.Count);
            return items;
        }
    }
}