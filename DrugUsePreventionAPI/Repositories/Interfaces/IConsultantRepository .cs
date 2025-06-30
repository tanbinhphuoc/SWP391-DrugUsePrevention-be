using DrugUsePreventionAPI.Models.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface IConsultantRepository : IGenericRepository<Consultant>
    {
        Task<IEnumerable<Consultant>> GetAvailableConsultantsAsync();
        Task<Consultant> GetConsultantWithUserAsync(int id);
        Task<Consultant> GetConsultantWithUserAndCertificateAsync(int id);
        Task<bool> HasConfirmedAppointmentsAsync(int id);
        Task<Consultant> GetByUserIdAsync(int userId);
        Task<Consultant> GetByUserIdTrackedAsync(int userId);
    }
}