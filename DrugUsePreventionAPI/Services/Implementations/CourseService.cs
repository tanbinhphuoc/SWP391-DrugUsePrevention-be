using DrugUsePreventionAPI.Models.DTOs.Course;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Exceptions;
using Serilog;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class CourseService : ICourseService
    {
        private readonly IUnitOfWork _unitOfWork;

        public CourseService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<bool> CreateCourse(CreateCourseDto courseDto)
        {
            Log.Information("Creating course with title {Title}", courseDto.Title);
            if (courseDto.Type != "COBAN" && courseDto.Type != "NANGCAO")
            {
                Log.Warning("Invalid course type {Type}", courseDto.Type);
                throw new BusinessRuleViolationException("Course type must be COBAN or NANGCAO.");
            }

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
                Type = courseDto.Type,
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow
            };

            await _unitOfWork.Courses.AddAsync(course);
            await _unitOfWork.SaveChangesAsync();
            Log.Information("Created course {Title} with ID {CourseId}", course.Title, course.CourseID);
            return true;
        }

        public async Task<bool> UpdateCourse(int id, CreateCourseDto courseDto)
        {
            Log.Information("Updating course with ID {CourseId}", id);
            if (courseDto.Type != "COBAN" && courseDto.Type != "NANGCAO")
            {
                Log.Warning("Invalid course type {Type}", courseDto.Type);
                throw new BusinessRuleViolationException("Course type must be COBAN or NANGCAO.");
            }

            var course = await _unitOfWork.Courses.GetByIdAsync(id);
            if (course == null)
            {
                Log.Warning("Course with ID {CourseId} not found", id);
                throw new EntityNotFoundException("Course", id);
            }

            course.Title = courseDto.Title;
            course.Description = courseDto.Description;
            course.StartDate = courseDto.StartDate;
            course.EndDate = courseDto.EndDate;
            course.Status = courseDto.Status;
            course.AgeMin = courseDto.AgeMin;
            course.AgeMax = courseDto.AgeMax;
            course.Capacity = courseDto.Capacity;
            course.Price = courseDto.Price;
            course.Type = courseDto.Type;
            course.UpdatedAt = DateTime.UtcNow;

            _unitOfWork.Courses.Update(course);
            await _unitOfWork.SaveChangesAsync();
            Log.Information("Updated course {Title}", course.Title);
            return true;
        }

        public async Task<List<Course>> GetAllCourses()
        {
            Log.Information("Retrieving all courses");
            var courses = (await _unitOfWork.Courses.GetAllAsync()).ToList();
            Log.Information("Retrieved {Count} courses", courses.Count);
            return courses;
        }

        public async Task<Course?> GetCourseById(int id)
        {
            Log.Information("Retrieving course with ID {CourseId}", id);
            var course = await _unitOfWork.Courses.GetByIdAsync(id);
            if (course == null)
            {
                Log.Warning("Course with ID {CourseId} not found", id);
                throw new EntityNotFoundException("Course", id);
            }
            Log.Information("Retrieved course {Title}", course.Title);
            return course;
        }

        public async Task<bool> DeleteCourse(int id)
        {
            Log.Information("Deleting course with ID {CourseId}", id);
            var course = await _unitOfWork.Courses.GetByIdAsync(id);
            if (course == null)
            {
                Log.Warning("Course with ID {CourseId} not found", id);
                return false;
            }

            _unitOfWork.Courses.Remove(course);
            await _unitOfWork.SaveChangesAsync();
            Log.Information("Deleted course {Title}", course.Title);
            return true;
        }

        public async Task<List<Course>> GetCoursesByTypeAsync(string type)
        {
            Log.Information("Retrieving courses with type {Type}", type);
            var courses = await _unitOfWork.Courses.GetCoursesByTypeAsync(type);
            Log.Information("Retrieved {Count} courses with type {Type}", courses.Count, type);
            return courses;
        }
    }

}