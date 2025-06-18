using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Repositories
{
    public class AppointmentRepository : GenericRepository<Appointment>, IAppointmentRepository
    {
        public AppointmentRepository(ApplicationDbContext context) : base(context) { }

        public async Task<IEnumerable<Appointment>> GetAppointmentsByUserAsync(int userId)
        {
            return await _context.Appointments
                .Include(a => a.Consultant).ThenInclude(c => c.User)
                .Include(a => a.User)
                .Where(a => a.UserID == userId)
                .ToListAsync();
        }

        public async Task<IEnumerable<Appointment>> GetAppointmentsByConsultantAsync(int consultantId)
        {
            var currentDateTime = DateTime.Now;
            return await _context.Appointments
                .Include(a => a.User)
                .Include(a => a.Consultant).ThenInclude(c => c.User)
                .Where(a => a.ConsultantID == consultantId && a.Status == "CONFIRMED" && a.StartDateTime > currentDateTime)
                .OrderBy(a => a.StartDateTime)
                .ToListAsync();
        }

        public async Task<Appointment> GetAppointmentWithDetailsAsync(int appointmentId)
        {
            return await _context.Appointments
                .Include(a => a.Consultant).ThenInclude(c => c.User)
                .Include(a => a.User)
                .FirstOrDefaultAsync(a => a.AppointmentID == appointmentId);
        }
    }

}
