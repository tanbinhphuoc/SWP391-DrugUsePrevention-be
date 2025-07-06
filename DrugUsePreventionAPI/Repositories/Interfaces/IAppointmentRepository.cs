using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Models.DTOs.Admin;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface IAppointmentRepository : IGenericRepository<Appointment>
    {
        Task<IEnumerable<Appointment>> GetByUserIdAsync(int userId);
        Task<IEnumerable<Appointment>> GetByConsultantIdAsync(int consultantId);
        Task<Appointment> GetAppointmentWithDetailsAsync(int appointmentId);
        Task<bool> IsTimeSlotBookedAsync(int consultantId, DateTime startDateTime, DateTime endDateTime);
        Task<Payment> GetByAppointmentIdAsync(int appointmentId);
        Task UpdateAppointmentSchedulesAsync(int appointmentId, List<int> scheduleIds);
        Task<AppointmentStatDto> GetAppointmentStatisticsAsync(DateTime? startDate, DateTime? endDate);
        Task<IEnumerable<Appointment>> GetAllAppointmentsAsync();
    }
}
