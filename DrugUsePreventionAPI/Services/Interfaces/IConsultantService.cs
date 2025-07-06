using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IConsultantService
    {
        Task<ConsultantDto> CreateConsultantAsync(CreateConsultantDto createConsultantDto);
        Task<ConsultantDto> GetConsultantByIdAsync(int id);
        Task<ConsultantDto> UpdateConsultantAsync(int id, AdminUpdateConsultantDto updateConsultantDto);
        Task<bool> DeleteConsultantAsync(int id);
        Task<ConsultantDto> UpdateConsultantProfileAsync(int userId, UpdateConsultantDto updateConsultantDto, bool isAdmin = false);
        Task<IEnumerable<ConsultantDto>> GetConsultantsBySpecialtyAsync(string specialty);
        Task<IEnumerable<ConsultantDto>> GetConsultantsByStatusAsync(string status);
        Task<Dictionary<string, object>> GetConsultantPerformanceStatsAsync(int consultantId);
    }
}