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
            try
            {
                if (courseDto.Type != "HocSinh" && courseDto.Type != "SinhVien" && courseDto.Type != "PhuHuynh")
                {
                    return false;
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
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<bool> UpdateCourse(int id, CreateCourseDto courseDto)
        {
            if (courseDto.Type != "HocSinh" && courseDto.Type != "SinhVien" && courseDto.Type != "PhuHuynh")
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
            try
            {
                _unitOfWork.Courses.Remove(course);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<bool> IsGetCourse(double score)
        {
           return score <= 4 ? true : false; //dưới 4 sẽ dựa vào tuổi của người dùng để đưa ra khóa học, trên 4 điều hướng qua gặp consultan
        }

        public async Task<List<Course>> GetCoursesByAge(int age)
        {
            //du lieu tho tra ve toan bo course
            var allCourses = await _unitOfWork.Courses.GetAllCourses();
            //xu ly logic lay course theo do tuoi
            var courses = allCourses.Where(c => c.AgeMin <= age && c.AgeMax >= age).ToList();
            return courses;
        }
    }

}