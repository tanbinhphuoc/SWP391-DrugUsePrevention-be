using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories
{
    public class ConsultantScheduleRepository : GenericRepository<ConsultantSchedule>, IConsultantScheduleRepository
    {
        public ConsultantScheduleRepository(ApplicationDbContext context) : base(context) { }

        public async Task<IEnumerable<(ConsultantSchedule Schedule, string? AppointmentStatus, string? PaymentStatus)>> GetSchedulesWithAppointmentStatusAsync(int consultantId, DateTime startDate, DateTime endDate)
        {
            try
            {
                var schedules = await _context.Database
                    .SqlQueryRaw<ScheduleWithStatus>(
                        "EXEC GetConsultantSchedulesWithStatus @ConsultantId, @StartDate, @EndDate",
                        new[]
                        {
                            new SqlParameter("@ConsultantId", consultantId),
                            new SqlParameter("@StartDate", startDate.Date),
                            new SqlParameter("@EndDate", endDate.Date)
                        })
                    .ToListAsync();

                return schedules.Select(s => (
                    new ConsultantSchedule
                    {
                        ScheduleID = s.ScheduleID,
                        ConsultantID = s.ConsultantID,
                        DayOfWeek = s.DayOfWeek ?? string.Empty, // Xử lý NULL
                        Date = s.Date,
                        StartTime = s.StartTime,
                        EndTime = s.EndTime,
                        IsAvailable = s.IsAvailable,
                        Notes = s.Notes ?? string.Empty // Xử lý NULL
                    },
                    s.AppointmentStatus,
                    s.PaymentStatus
                ));
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Error executing GetConsultantSchedulesWithStatus for ConsultantId={ConsultantId}", consultantId);
                throw;
            }
        }
        public async Task<IEnumerable<ConsultantSchedule>> GetSchedulesByConsultantAndDateRangeAsync(int consultantId, DateTime startDate, DateTime endDate)
        {
            return await _context.ConsultantSchedules
                .AsNoTracking()
                .Where(s => s.ConsultantID == consultantId &&
                           s.Date >= startDate && s.Date <= endDate)
                .ToListAsync();
        }

        public async Task<IEnumerable<ConsultantSchedule>> GetSchedulesByConsultantAsync(int consultantId)
        {
            return await _context.ConsultantSchedules
                .AsNoTracking()
                .Where(s => s.ConsultantID == consultantId)
                .ToListAsync();
        }

        public async Task<IEnumerable<ConsultantSchedule>> GetSchedulesByAppointmentAsync(int appointmentId)
        {
            var appointment = await _context.Appointments
                .AsNoTracking()
                .FirstOrDefaultAsync(a => a.AppointmentID == appointmentId);
            if (appointment == null || string.IsNullOrEmpty(appointment.ScheduleIds))
                return new List<ConsultantSchedule>();

            var scheduleIds = appointment.ScheduleIds.Split(',').Select(int.Parse).ToList();
            return await _context.ConsultantSchedules
                .AsNoTracking()
                .Where(s => scheduleIds.Contains(s.ScheduleID))
                .ToListAsync();
        }

        public async Task<List<ConsultantSchedule>> GetByIdsAsync(List<int> scheduleIds)
        {
            return await _context.ConsultantSchedules
                .AsNoTracking()
                .Where(s => scheduleIds.Contains(s.ScheduleID))
                .ToListAsync();
        }

        public async Task RemoveRange(IEnumerable<ConsultantSchedule> schedules)
        {
            _context.ConsultantSchedules.RemoveRange(schedules);
            await _context.SaveChangesAsync();
        }

        public async Task<ConsultantSchedule> GetAsync(Expression<Func<ConsultantSchedule, bool>> predicate, CancellationToken cancellationToken = default)
        {
            return await _context.ConsultantSchedules
                .AsNoTracking()
                .FirstOrDefaultAsync(predicate, cancellationToken);
        }



    }
}