using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Repositories
{
    public class ConsultantRepository : GenericRepository<Consultant>, IConsultantRepository
    {
        public ConsultantRepository(ApplicationDbContext context) : base(context) { }

        public async Task<Consultant> GetConsultantWithUserAndCertificateAsync(int id)
        {
            return await _context.Consultants
                .Include(c => c.User)
                .Include(c => c.Certificate)
                .FirstOrDefaultAsync(c => c.ConsultantID == id);
        }

        public async Task<IEnumerable<Consultant>> GetActiveConsultantsAsync()
        {
            return await _context.Consultants
                .Include(c => c.User)
                .Include(c => c.Certificate)
                .Where(c => c.User.Status == "Active")
                .ToListAsync();
        }

        public async Task<bool> HasConfirmedAppointmentsAsync(int consultantId)
        {
            return await _context.Appointments
                .AnyAsync(a => a.ConsultantID == consultantId && a.Status == "CONFIRMED");
        }

        public async Task<Consultant> GetByUserIdAsync(int userId)
        {
            return await _context.Consultants
                .FirstOrDefaultAsync(c => c.UserID == userId);
        }
    }

}