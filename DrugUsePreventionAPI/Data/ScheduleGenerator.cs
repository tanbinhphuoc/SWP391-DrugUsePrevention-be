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

        public async Task GenerateDailySchedulesAsync(DateTime date)
        {
            try
            {
                var consultants = await _context.Consultants.ToListAsync();
                var schedulesToAdd = new List<ConsultantSchedule>();

                foreach (var consultant in consultants)
                {
                    // Skip if schedules already exist for the date
                    if (await _context.ConsultantSchedules.AnyAsync(s => s.ConsultantID == consultant.ConsultantID && s.Date == date))
                        continue;

                    // Generate slots from 10:00 to 18:00
                    for (int hour = 10; hour < 18; hour++)
                    {
                        schedulesToAdd.Add(new ConsultantSchedule
                        {
                            ConsultantID = consultant.ConsultantID,
                            DayOfWeek = date.ToString("dddd"),
                            Date = date,
                            StartTime = TimeSpan.FromHours(hour),
                            EndTime = TimeSpan.FromHours(hour + 1),
                            IsAvailable = true,
                            Notes = null
                        });
                    }
                }

                _context.ConsultantSchedules.AddRange(schedulesToAdd);
                await _context.SaveChangesAsync();

                Log.Information("Generated {Count} schedules for date {Date}", schedulesToAdd.Count, date.ToString("yyyy-MM-dd"));
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error generating schedules for date {Date}", date.ToString("yyyy-MM-dd"));
                throw;
            }
        }
    }
}
