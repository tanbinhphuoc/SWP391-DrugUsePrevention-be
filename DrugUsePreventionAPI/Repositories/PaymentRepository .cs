using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.DTOs.Admin;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using Serilog;

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

        public async Task<IEnumerable<Payment>> GetPaymentsByUserIdAsync(int userId, DateTime? startDate, DateTime? endDate)
        {
            try
            {
                var query = _context.Payments
                    .Where(p => p.UserID == userId);

                // Apply filters before Include
                if (startDate.HasValue)
                    query = query.Where(p => p.PaymentDate >= startDate.Value);
                if (endDate.HasValue)
                    query = query.Where(p => p.PaymentDate <= endDate.Value);

                // Now include the necessary related entities
                query = query.Include(p => p.Appointment)
                             .ThenInclude(a => a.User)
                             .Include(p => p.Appointment)
                             .ThenInclude(a => a.Consultant)
                             .ThenInclude(c => c.User);

                var payments = await query
                    .Where(p => p.Appointment != null && p.Appointment.Consultant != null && p.Appointment.User != null)
                    .ToListAsync();

                if (!payments.Any())
                {
                    Log.Warning("No payments found for user {UserId} in date range {StartDate} to {EndDate}", userId, startDate, endDate);
                }

                return payments;
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving payments for user {UserId}: startDate={StartDate}, endDate={EndDate}", userId, startDate, endDate);
                throw;
            }
        }

        public async Task<IEnumerable<Payment>> GetAllPaymentsAsync(DateTime? startDate, DateTime? endDate, string status = null)
        {
            try
            {
                var query = _context.Payments.AsQueryable();

                // Apply filters before Include
                if (startDate.HasValue)
                    query = query.Where(p => p.PaymentDate >= startDate.Value);
                if (endDate.HasValue)
                    query = query.Where(p => p.PaymentDate <= endDate.Value);
                if (!string.IsNullOrEmpty(status))
                    query = query.Where(p => p.Status == status);

                // Now include the necessary related entities
                query = query.Include(p => p.Appointment)
                             .ThenInclude(a => a.User)
                             .Include(p => p.Appointment)
                             .ThenInclude(a => a.Consultant)
                             .ThenInclude(c => c.User);

                var payments = await query
                    .Where(p => p.Appointment != null && p.Appointment.Consultant != null && p.Appointment.User != null)
                    .ToListAsync();

                if (!payments.Any())
                {
                    Log.Warning("No payments found for date range {StartDate} to {EndDate} with status {Status}", startDate, endDate, status);
                }

                return payments;
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving all payments: startDate={StartDate}, endDate={EndDate}, status={Status}", startDate, endDate, status);
                throw;
            }
        }


        public async Task<PaymentStatDto> GetPaymentStatisticsAsync(DateTime? startDate, DateTime? endDate)
        {
            Log.Information("Retrieving payment statistics from {StartDate} to {EndDate}", startDate, endDate);

            var query = _context.Payments.AsNoTracking();
            if (startDate.HasValue)
                query = query.Where(p => p.PaymentDate >= startDate.Value);
            if (endDate.HasValue)
                query = query.Where(p => p.PaymentDate <= endDate.Value);

            var totalPayments = await query.CountAsync();
            var totalSuccessful = await query.CountAsync(p => p.Status == "SUCCESS");
            var totalPending = await query.CountAsync(p => p.Status == "PENDING");
            var totalAmountPaid = await query.Where(p => p.Status == "SUCCESS").SumAsync(p => p.Amount ?? 0);

            var stats = new PaymentStatDto
            {
                TotalPayments = totalPayments,
                TotalSuccessfulPayments = totalSuccessful,
                TotalPendingPayments = totalPending,
                TotalAmountPaid = totalAmountPaid
            };

            Log.Information("Retrieved payment statistics: Total={Total}, Successful={Successful}, Pending={Pending}, AmountPaid={AmountPaid}",
                totalPayments, totalSuccessful, totalPending, totalAmountPaid);
            return stats;
        }
    }
}

