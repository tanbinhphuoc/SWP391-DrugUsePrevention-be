using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Repositories
{
    public class PaymentRepository : GenericRepository<Payment>, IPaymentRepository
    {
        public PaymentRepository(ApplicationDbContext context) : base(context) { }

        public async Task<Payment> GetPaymentWithAppointmentDetailsAsync(int paymentId)
        {
            return await _context.Payments
                .Include(p => p.Appointment)
                    .ThenInclude(a => a.User)
                .Include(p => p.Appointment)
                    .ThenInclude(a => a.Consultant)
                        .ThenInclude(c => c.User)
                .FirstOrDefaultAsync(p => p.PaymentID == paymentId);
        }

        public async Task<IEnumerable<Payment>> GetPaymentsByDateAndStatusAsync(DateTime? startDate, DateTime? endDate, string status)
        {
            var query = _context.Payments.AsQueryable();

            if (startDate.HasValue)
                query = query.Where(p => p.PaymentDate >= startDate.Value);
            if (endDate.HasValue)
                query = query.Where(p => p.PaymentDate <= endDate.Value);
            if (!string.IsNullOrEmpty(status))
                query = query.Where(p => p.Status == status);

            return await query.ToListAsync();
        }

        public async Task<Payment> GetPaymentByAppointmentIdAsync(int appointmentId)
        {
            return await _context.Payments
                .Include(p => p.Appointment)
                    .ThenInclude(a => a.User)
                .Include(p => p.Appointment)
                    .ThenInclude(a => a.Consultant)
                        .ThenInclude(c => c.User)
                .FirstOrDefaultAsync(p => p.AppointmentID == appointmentId);
        }

        public async Task<Payment> GetByAppointmentAndTransactionAsync(int appointmentId, string transactionId)
        {
            return await _context.Payments
                .FirstOrDefaultAsync(p => p.AppointmentID == appointmentId && p.TransactionID == transactionId);
        }
    }

}