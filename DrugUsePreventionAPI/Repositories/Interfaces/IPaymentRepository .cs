using DrugUsePreventionAPI.Models.Entities;
using System.Collections.Generic;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface IPaymentRepository : IGenericRepository<Payment>
    {
        Task<Payment> GetPaymentWithAppointmentDetailsAsync(int paymentId); 
        Task<IEnumerable<Payment>> GetPaymentsByDateAndStatusAsync(DateTime? startDate, DateTime? endDate, string status); 
        Task<Payment> GetPaymentByAppointmentIdAsync(int appointmentId);  
        Task<Payment> GetByAppointmentAndTransactionAsync(int appointmentId, string transactionId);
    }
}
