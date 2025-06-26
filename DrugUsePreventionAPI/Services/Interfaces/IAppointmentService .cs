using DrugUsePreventionAPI.Models.DTOs.Appointment;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IAppointmentService
    {
        Task<IEnumerable<ConsultantDto>> GetAvailableConsultantsAsync();
        Task<IEnumerable<ConsultantScheduleDto>> GetConsultantSchedulesAsync(int consultantId, DateTime startDate, DateTime endDate);
        Task<(AppointmentDto appointment, string paymentUrl)> BookAppointmentAsync(BookAppointmentDto bookDto, int userId, HttpContext context = null);
        Task<AppointmentDto> ConfirmPaymentAsync(int appointmentId, string transactionId, string vnpayResponseCode, HttpContext context);
        Task<IEnumerable<AppointmentDto>> GetUserAppointmentsAsync(int userId);
        Task<IEnumerable<AppointmentDto>> GetConsultantAppointmentsAsync(int consultantId);
        Task HandleIPNAsync(Dictionary<string, string> queryParams);
    }
}