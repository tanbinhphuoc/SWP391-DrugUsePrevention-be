using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Models.DTOs.Admin;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface IPaymentRepository : IGenericRepository<Payment>
    {
        Task<Payment> GetPaymentWithAppointmentDetailsAsync(int paymentId);
        Task<IEnumerable<Payment>> GetPaymentsByDateAndStatusAsync(DateTime? startDate, DateTime? endDate, string status);
        Task<Payment> GetPaymentByAppointmentIdAsync(int appointmentId);
        Task<Payment> GetByAppointmentAndTransactionAsync(int appointmentId, string transactionId);
        Task<IEnumerable<Payment>> GetPaymentsByUserIdAsync(int userId, DateTime? startDate, DateTime? endDate);
        Task<IEnumerable<Payment>> GetAllPaymentsAsync(DateTime? startDate, DateTime? endDate, string status = null);
        Task<PaymentStatDto> GetPaymentStatisticsAsync(DateTime? startDate, DateTime? endDate); // Thêm mới
    }
}