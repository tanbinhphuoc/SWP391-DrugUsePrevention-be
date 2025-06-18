using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Serilog;
using System;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Data.Extensions
{
    public class ScheduleGenerator
    {
        private readonly IUnitOfWork _unitOfWork;

        public ScheduleGenerator(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task GenerateDailySchedulesAsync(DateTime startDate)
        {
            var consultants = await _unitOfWork.Consultants.GetAllAsync(); 
            var endDate = startDate.AddDays(7);

            foreach (var consultant in consultants)
            {
                var currentDate = startDate;
                while (currentDate <= endDate)
                {
                    for (var hour = 7; hour < 19; hour++)
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
                        await _unitOfWork.ConsultantSchedules.AddAsync(schedule); // Thêm lịch sử dụng UnitOfWork
                    }
                    currentDate = currentDate.AddDays(1);
                }
            }
            await _unitOfWork.SaveChangesAsync(); // Lưu tất cả các thay đổi
            Log.Information("Generated schedules from {StartDate} to {EndDate} for all consultants", startDate, endDate);
        }
    }
}
