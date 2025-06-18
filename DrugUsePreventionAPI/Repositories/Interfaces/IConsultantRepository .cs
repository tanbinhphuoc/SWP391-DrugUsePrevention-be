using DrugUsePreventionAPI.Models.Entities;
using System.Collections.Generic;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface IConsultantRepository : IGenericRepository<Consultant>
    {
        // Lấy Consultant với User và Certificate
        Task<Consultant> GetConsultantWithUserAndCertificateAsync(int id);

        // Lấy tất cả Consultant đang hoạt động
        Task<IEnumerable<Consultant>> GetActiveConsultantsAsync();

        // Kiểm tra Consultant có cuộc hẹn đã xác nhận hay không
        Task<bool> HasConfirmedAppointmentsAsync(int consultantId);

        // Lấy Consultant theo UserID
        Task<Consultant> GetByUserIdAsync(int userId);
    }
}
