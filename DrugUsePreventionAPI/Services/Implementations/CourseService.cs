using DrugUsePreventionAPI.Models.DTOs.Course;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.Extensions.Configuration;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class CourseService : ICourseService
    {
        private readonly IUnitOfWork _unitOfWork; private readonly IConfiguration _configuration;

        public CourseService(IUnitOfWork unitOfWork, IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _configuration = configuration;
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
                return false;
            }
            var course = await _unitOfWork.Courses.GetByIdAsync(id);
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
            course.Type = courseDto.Type;
            course.UpdatedAt = DateTime.UtcNow;

            try
            {
                _unitOfWork.Courses.Update(course);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<List<Course>> GetAllCourses()
        {
            return (await _unitOfWork.Courses.GetAllAsync()).ToList();
        }

        public async Task<Course?> GetCourseById(int id)
        {
            return await _unitOfWork.Courses.GetByIdAsync(id);
        }

        public async Task<bool> DeleteCourse(int id)
        {
            var course = await _unitOfWork.Courses.GetByIdAsync(id);
            if (course == null)
            {
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