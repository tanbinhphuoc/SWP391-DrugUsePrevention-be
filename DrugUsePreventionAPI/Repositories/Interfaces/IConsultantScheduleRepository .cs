using DrugUsePreventionAPI.Models.Entities;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface IConsultantScheduleRepository : IGenericRepository<ConsultantSchedule>
    {
        Task<IEnumerable<ConsultantSchedule>> GetSchedulesByConsultantAndDateRangeAsync(int consultantId, DateTime startDate, DateTime endDate);
        Task<IEnumerable<ConsultantSchedule>> GetSchedulesByConsultantAsync(int consultantId);
        Task<IEnumerable<ConsultantSchedule>> GetSchedulesByAppointmentAsync(int appointmentId);
        Task<List<ConsultantSchedule>> GetByIdsAsync(List<int> scheduleIds);
        Task RemoveRange(IEnumerable<ConsultantSchedule> schedules);
        Task<ConsultantSchedule> GetAsync(Expression<Func<ConsultantSchedule, bool>> predicate, CancellationToken cancellationToken = default);
    }
}