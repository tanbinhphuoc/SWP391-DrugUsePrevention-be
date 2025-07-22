using DrugUsePreventionAPI.Models.DTOs.Admin;
using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IAppointmentService
    {
        Task<IEnumerable<ConsultantDto>> GetAvailableConsultantsAsync();
        Task<IEnumerable<ConsultantScheduleResponseDto>> GetConsultantSchedulesAsync(int consultantId, DateTime startDate, DateTime endDate);
        Task<(AppointmentDto appointment, string paymentUrl)> BookAppointmentAsync(BookAppointmentDto bookDto, int userId, string clientIp, HttpContext context = null);
        Task<AppointmentDto> BookFreeAppointmentAsync(BookAppointmentDto bookDto, int userId);
        Task<AppointmentDto> ConfirmFreeAppointmentAsync(int appointmentId, int confirmerId);
        Task CancelAppointmentAsync(int appointmentId, int userId, string userRole);
        Task<AppointmentDto> ConfirmPaymentAsync(int appointmentId, string transactionId, string vnpayResponseCode, HttpContext context);
        Task<IEnumerable<AppointmentDto>> GetUserAppointmentsAsync(int userId);
        Task<IEnumerable<AppointmentDto>> GetConsultantAppointmentsAsync(int consultantId);
        Task HandleIPNAsync(Dictionary<string, string> queryParams);
        Task<IEnumerable<PaymentHistoryDto>> GetPaymentHistoryAsync(int userId, bool isAdmin, DateTime? startDate, DateTime? endDate);
        Task<AppointmentStatDto> GetAppointmentStatisticsAsync(DateTime? startDate, DateTime? endDate);
        Task<PaymentStatDto> GetPaymentStatisticsAsync(DateTime? startDate, DateTime? endDate);
        Task<IEnumerable<AppointmentAdmindto>> GetAllAppointmentsAsync();
        Task UpdateAppointmentStatusAsync(int appointmentId, string newStatus);
        Task ResendAppointmentEmailAsync(int appointmentId);
    }
}