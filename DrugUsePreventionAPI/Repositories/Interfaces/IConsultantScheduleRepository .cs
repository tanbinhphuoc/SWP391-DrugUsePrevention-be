using DrugUsePreventionAPI.Models.Entities;
using System.Collections;

namespace DrugUsePreventionAPI.Repositories.Interfaces {
    public interface IConsultantScheduleRepository : IGenericRepository<ConsultantSchedule> {
        Task<IEnumerable<ConsultantSchedule>> GetSchedulesByConsultantAndDateRangeAsync(int consultantId, DateTime startDate, DateTime endDate); 
        Task<IEnumerable<ConsultantSchedule>> GetSchedulesByConsultantAsync(int consultantId);   
        Task<IEnumerable<ConsultantSchedule>> GetSchedulesByAppointmentAsync(int consultantId, DateTime startDateTime, DateTime endDateTime);
    }
}