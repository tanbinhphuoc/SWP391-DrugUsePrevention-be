using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface IAppointmentRepository : IGenericRepository<Appointment>
    {
        Task<IEnumerable<Appointment>> GetAppointmentsByUserAsync(int userId);
        Task<IEnumerable<Appointment>> GetAppointmentsByConsultantAsync(int consultantId);
        Task<Appointment> GetAppointmentWithDetailsAsync(int appointmentId);
    }
}