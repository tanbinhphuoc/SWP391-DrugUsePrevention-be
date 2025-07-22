using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Repositories
{
    public class CourseRegistrationRepository : GenericRepository<CourseRegistration>, ICourseRegistrationRepository
    {
        public CourseRegistrationRepository(ApplicationDbContext context) : base(context) { }

        public async Task<CourseRegistration> GetByIdWithDetailsAsync(int id)
        {
            return await _context.CourseRegistrations
                .Include(cr => cr.Course)
                .Include(cr => cr.User)
                .FirstOrDefaultAsync(cr => cr.CourseRegistrationID == id);
        }

        public async Task<CourseRegistration> GetByTransactionAsync(string transactionId)
        {
            return await _context.CourseRegistrations
                .Include(cr => cr.Course)
                .Include(cr => cr.User)
                .FirstOrDefaultAsync(cr => cr.TransactionID == transactionId);
        }

        public async Task<IEnumerable<CourseRegistration>> GetByUserIdAsync(int userId)
        {
            return await _context.CourseRegistrations
                .Where(cr => cr.UserID == userId)
                .Include(cr => cr.Course)
                .ToListAsync();
        }
        public async Task<CourseRegistration?> GetLatestByUserAndCourseAsync(int userId, int courseId)
        {
            return await _context.CourseRegistrations
                .Where(r => r.UserID == userId && r.CourseID == courseId)
                .OrderByDescending(r => r.RegistrationDate)
                .FirstOrDefaultAsync();
        }
        public async Task<CourseRegistration?> GetByIdAsync(int courseRegistrationId)
        {
            return await _context.CourseRegistrations
                .Include(cr => cr.Course)
                .Include(cr => cr.User)
                .FirstOrDefaultAsync(cr => cr.CourseRegistrationID == courseRegistrationId);
        }


        public async Task<IEnumerable<CourseRegistration>> GetConfirmedAndPaidByUserIdAsync(int userId)
        {
            return await _context.CourseRegistrations
             .Where(cr => cr.UserID == userId
                          && cr.Status == "CONFIRMED"
                          && cr.PaymentStatus == "SUCCESS"
                          && cr.Course.IsDeleted == false) 
             .Include(cr => cr.Course)
             .Include(cr => cr.User)
             .ToListAsync();
        }

        public async Task<int> CountByCourseIdAndStatusAsync(int courseId, IEnumerable<string> statuses)
        {
            return await _context.CourseRegistrations
                .Where(r => r.CourseID == courseId && statuses.Contains(r.Status))
                .CountAsync();
        }





    }

}
