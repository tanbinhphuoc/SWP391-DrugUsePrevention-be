using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.DTOs.User;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IConsultantService
    {
        Task<ConsultantDto> CreateConsultantAsync(CreateConsultantDto createConsultantDto);
        Task<ConsultantDto> GetConsultantByIdAsync(int id);
        Task<ConsultantDto> UpdateConsultantAsync(int id, UpdateConsultantDto updateConsultantDto);
        Task<bool> DeleteConsultantAsync(int id);
        Task<ConsultantDto> UpdateConsultantProfileAsync(int userId, UpdateConsultantDto updateConsultantDto, bool isAdmin = false);
    }
}