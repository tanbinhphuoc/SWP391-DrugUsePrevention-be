using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.DTOs.Course;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class CourseService : ICourseService
    {
        private readonly ApplicationDbContext _context;
        private readonly IConfiguration _configuration;

        public CourseService(ApplicationDbContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }
        public async Task<bool> CreateCourse(CreateCourseDto courseDto)
        {
            try
            {
                var course = new Course
                {
                    Title = courseDto.Title,
                    Description = courseDto.Description,
                    StartDate = courseDto.StartDate,
                    EndDate = courseDto.EndDate,
                    Status = courseDto.Status,
                    AgeMin = courseDto.AgeMin,
                    AgeMax = courseDto.AgeMax,
                    Capacity = courseDto.Capacity,
                    Price = courseDto.Price,
                    CreatedAt = DateTime.UtcNow,
                    UpdatedAt = DateTime.UtcNow
                };

                _context.Courses.Add(course);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public async Task<List<Course>> GetAllCourses()
        {
            return await _context.Courses.ToListAsync();
        }

        public async Task<Course?> GetCourseById(int id)
        {
            return await _context.Courses.FindAsync(id);
        }

        public async Task<bool> UpdateCourse(int id, CreateCourseDto courseDto)
        {
            var course = await _context.Courses.FindAsync(id);
            if (course == null)
                return false;

            course.Title = courseDto.Title;
            course.Description = courseDto.Description;
            course.StartDate = courseDto.StartDate;
            course.EndDate = courseDto.EndDate;
            course.Status = courseDto.Status;
            course.AgeMin = courseDto.AgeMin;
            course.AgeMax = courseDto.AgeMax;
            course.Capacity = courseDto.Capacity;
            course.Price = courseDto.Price;
            course.UpdatedAt = DateTime.UtcNow;

            try
            {
                _context.Courses.Update(course);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<bool> DeleteCourse(int id)
        {
            var course = await _context.Courses.FindAsync(id);
            if (course == null)
                return false;

            try
            {
                _context.Courses.Remove(course);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
