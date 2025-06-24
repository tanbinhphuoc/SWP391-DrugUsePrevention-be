using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
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