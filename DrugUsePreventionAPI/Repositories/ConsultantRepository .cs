using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
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
                .Where(c => c.User.Status == "Active" &&
                           _context.ConsultantSchedules.Any(s => s.ConsultantID == c.ConsultantID && s.IsAvailable))
                .ToListAsync();
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

    }
}