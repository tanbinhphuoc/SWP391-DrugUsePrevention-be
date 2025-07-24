using DrugUsePreventionAPI.Models.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface IConsultantRepository : IGenericRepository<Consultant>
    {
        Task<IEnumerable<Consultant>> GetAvailableConsultantsAsync();
        Task<IEnumerable<Consultant>> GetAllConsultantsAsync();
        Task<Consultant> GetConsultantWithUserAsync(int id);
        Task<Consultant> GetConsultantWithUserAndCertificateAsync(int id);
        Task<bool> HasConfirmedAppointmentsAsync(int id);
        Task<Consultant> GetByUserIdAsync(int userId);
        Task<Consultant> GetByUserIdTrackedAsync(int userId);
        Task<IEnumerable<Consultant>> GetConsultantsBySpecialtyAsync(string specialty);
        Task<IEnumerable<Consultant>> GetConsultantsByStatusAsync(string status);
        Task<int> GetConsultationCountAsync(int consultantId);
        Task<decimal> GetRevenueAsync(int consultantId);
        Task<decimal> GetCancellationRateAsync(int consultantId);
    }
}