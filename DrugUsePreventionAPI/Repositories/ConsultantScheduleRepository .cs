using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Repositories
{
    public class ConsultantScheduleRepository : GenericRepository<ConsultantSchedule>, IConsultantScheduleRepository
    {
        public ConsultantScheduleRepository(ApplicationDbContext context) : base(context) { }

        public async Task<IEnumerable<ConsultantSchedule>> GetSchedulesByConsultantAndDateRangeAsync(int consultantId, DateTime startDate, DateTime endDate)
        {
            return await _context.ConsultantSchedules
                .Where(s => s.ConsultantID == consultantId && s.Date >= startDate && s.Date <= endDate)
                .ToListAsync();
        }

        public async Task<IEnumerable<ConsultantSchedule>> GetSchedulesByConsultantAsync(int consultantId)
        {
            return await _context.ConsultantSchedules
                .Where(s => s.ConsultantID == consultantId)
                .ToListAsync();
        }

        public async Task<IEnumerable<ConsultantSchedule>> GetSchedulesByAppointmentAsync(int consultantId, DateTime startDateTime, DateTime endDateTime)
        {
            return await _context.ConsultantSchedules
                .Where(s => s.ConsultantID == consultantId &&
                            s.Date >= startDateTime.Date &&
                            s.Date <= endDateTime.Date &&
                            s.StartTime >= startDateTime.TimeOfDay &&
                            s.EndTime <= endDateTime.TimeOfDay)
                .ToListAsync();
        }
    }

}