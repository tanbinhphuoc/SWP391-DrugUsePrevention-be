using DrugUsePreventionAPI.Models.Entities;
using Microsoft.EntityFrameworkCore;
using Serilog;

namespace DrugUsePreventionAPI.Data
{
    public class ScheduleGenerator
    {
        private readonly ApplicationDbContext _context;
        public ScheduleGenerator(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task GenerateDailySchedulesAsync(DateTime startDate)
        {
            var consultants = await _context.Consultants.ToListAsync();
            var endDate = startDate.AddDays(7); // Tạo lịch cho 7 ngày

            foreach (var consultant in consultants)
            {
                var currentDate = startDate;
                while (currentDate <= endDate)
                {
                    for (var hour = 7; hour < 19; hour++) // Từ 7:00 AM đến 7:00 PM
                    {
                        var schedule = new ConsultantSchedule
                        {
                            ConsultantID = consultant.ConsultantID,
                            DayOfWeek = currentDate.DayOfWeek.ToString(),
                            Date = currentDate,
                            StartTime = TimeSpan.FromHours(hour),
                            EndTime = TimeSpan.FromHours(hour + 1),
                            IsAvailable = true,
                            Notes = null
                        };
                        _context.ConsultantSchedules.Add(schedule);
                    }
                    currentDate = currentDate.AddDays(1);
                }
            }
            await _context.SaveChangesAsync();
            Log.Information("Generated schedules from {StartDate} to {EndDate} for all consultants", startDate, endDate);
        }
    }
}
