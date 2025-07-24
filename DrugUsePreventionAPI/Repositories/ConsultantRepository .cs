using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories
{
    public class ConsultantRepository : GenericRepository<Consultant>, IConsultantRepository
    {
        public ConsultantRepository(ApplicationDbContext context) : base(context) { }

        public async Task<IEnumerable<Consultant>> GetAvailableConsultantsAsync()
        {
            return await _context.Consultants
                .AsNoTracking()
                .Include(c => c.User)
                .Include(c => c.Certificate)
                .Where(c => c.User.Status == "Active" &&
                           _context.ConsultantSchedules.Any(s => s.ConsultantID == c.ConsultantID && s.IsAvailable))
                .ToListAsync();
        }
        public async Task<IEnumerable<Consultant>> GetAllConsultantsAsync()
        {
            return await _context.Consultants
                .Include(c => c.User)
                .Include(c => c.Certificate)
                .ToListAsync();
        }
        public override async Task<Consultant> GetByIdAsync(int id)
        {
            return await _context.Consultants
                .Include(c => c.User) 
                .FirstOrDefaultAsync(c => c.ConsultantID == id);
        }

        public async Task<Consultant> GetConsultantWithUserAsync(int id)
        {
            return await _context.Consultants
                .AsNoTracking()
                .Include(c => c.User)
                .FirstOrDefaultAsync(c => c.ConsultantID == id);
        }

        public async Task<Consultant> GetConsultantWithUserAndCertificateAsync(int id)
        {
            return await _context.Consultants
                .AsNoTracking()
                .Include(c => c.User)
                .Include(c => c.Certificate)
                .FirstOrDefaultAsync(c => c.ConsultantID == id);
        }

        public async Task<bool> HasConfirmedAppointmentsAsync(int id)
        {
            return await _context.Appointments
                .AnyAsync(a => a.ConsultantID == id && a.Status == "CONFIRMED");
        }

        public async Task<Consultant> GetByUserIdAsync(int userId)
        {
            return await _context.Consultants
                .AsNoTracking()
                .Include(c => c.User)
                .Include(c => c.Certificate)
                .FirstOrDefaultAsync(c => c.UserID == userId);
        }

        public async Task<Consultant> GetByUserIdTrackedAsync(int userId)
        {
            return await _context.Consultants
                .Include(c => c.User)
                .Include(c => c.Certificate)
                .FirstOrDefaultAsync(c => c.UserID == userId);
        }

        public async Task<IEnumerable<Consultant>> GetConsultantsBySpecialtyAsync(string specialty)
        {
            return await _context.Consultants
                .Include(c => c.User)
                .Where(c => c.Specialty == specialty)
                .ToListAsync();
        }

        public async Task<IEnumerable<Consultant>> GetConsultantsByStatusAsync(string status)
        {
            return await _context.Consultants
                .Include(c => c.User)
                .Include(c => c.Certificate)
                .Where(c => c.User.Status == status)
                .ToListAsync();
        }

        public async Task<int> GetConsultationCountAsync(int consultantId)
        {
            return await _context.Appointments
                .CountAsync(a => a.ConsultantID == consultantId && a.Status == "CONFIRMED");
        }

        public async Task<decimal> GetRevenueAsync(int consultantId)
        {
            return await _context.Appointments
                .Where(a => a.ConsultantID == consultantId && a.Status == "CONFIRMED")
                .SumAsync(a => a.Price);
        }

        public async Task<decimal> GetCancellationRateAsync(int consultantId)
        {
            var totalAppointments = await _context.Appointments
                .CountAsync(a => a.ConsultantID == consultantId);
            if (totalAppointments == 0) return 0;

            var cancelledAppointments = await _context.Appointments
                .CountAsync(a => a.ConsultantID == consultantId && a.Status == "CANCELED");
            return (decimal)cancelledAppointments / totalAppointments * 100;
        }
    }
}