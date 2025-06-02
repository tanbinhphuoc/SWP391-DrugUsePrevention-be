using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.DTOs.CourseRegistration;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class CourseRegistrationService : ICourseRegistrationService
    {
        private readonly ApplicationDbContext _context;
        private readonly IConfiguration _configuration;

        public CourseRegistrationService(ApplicationDbContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }
        public async Task CreateCourseRegistrationAsync(CreateCourseRegistrationDto createCourseRegistrationDto)
        {
            bool existedRegistration = await _context.CourseRegistrations.AnyAsync(a => a.UserID == createCourseRegistrationDto.userID && a.CourseID == createCourseRegistrationDto.courseID);
            if (existedRegistration)
            {
                throw new Exception("Ban da dang ky khoa hoc nay!");
            }
            CourseRegistration courseRegistration = new CourseRegistration()
            {
                CourseID = createCourseRegistrationDto.courseID,
                UserID = createCourseRegistrationDto.userID,
                RegisterTime = DateTime.Now
            };
            await _context.CourseRegistrations.AddAsync(courseRegistration);
            await _context.SaveChangesAsync();
        }
    }
}
