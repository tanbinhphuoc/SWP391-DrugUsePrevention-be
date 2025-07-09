using DrugUsePreventionAPI.Models.DTOs.CourseRegistration;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.Extensions.Configuration;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class CourseRegistrationService : ICourseRegistrationService
    {
        private readonly IUnitOfWork _unitOfWork; private readonly IConfiguration _configuration;

        public CourseRegistrationService(IUnitOfWork unitOfWork, IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _configuration = configuration;
        }

        public async Task CreateCourseRegistrationAsync(CreateCourseRegistrationDto createCourseRegistrationDto)
        {
            bool existedRegistration = await _unitOfWork.CourseRegistrations.ExistsAsync(
                createCourseRegistrationDto.userID, createCourseRegistrationDto.courseID);

            if (existedRegistration)
            {
                throw new Exception("Bạn đã đăng ký khóa học này!");
            }

            var course = await _unitOfWork.Courses.GetByIdAsync(createCourseRegistrationDto.courseID);
            if (course == null || course.IsDeleted)
            {
                throw new Exception("Không tìm thấy khóa học.");
            }

            // Không cho đăng ký nếu khóa học đang CLOSED
            if (course.Status.Equals("CLOSED", StringComparison.OrdinalIgnoreCase))
            {
                throw new Exception("Khóa học đã đóng, không thể đăng ký.");
            }

            // Nếu đang là PENDING thì chuyển sang OPEN
            if (course.Status.Equals("PENDING", StringComparison.OrdinalIgnoreCase))
            {
                course.Status = "OPEN";
                course.UpdatedAt = DateTime.UtcNow;
                _unitOfWork.Courses.Update(course);
            }

            // Cho phép đăng ký nếu Status = OPEN
            if (!course.Status.Equals("OPEN", StringComparison.OrdinalIgnoreCase))
            {
                throw new Exception("Khóa học hiện không mở để đăng ký.");
            }

            var courseRegistration = new CourseRegistration
            {
                CourseID = createCourseRegistrationDto.courseID,
                UserID = createCourseRegistrationDto.userID,
                RegisterTime = DateTime.Now
            };

            await _unitOfWork.CourseRegistrations.AddAsync(courseRegistration);

            // Tạo bản ghi UserCourseProgress cho theo dõi tiến độ
            var userProgress = new UserCourseProgress
            {
                CourseID = createCourseRegistrationDto.courseID,
                UserID = createCourseRegistrationDto.userID,
                IsCompleted = false,
                CompletedAt = null
            };

            await _unitOfWork.UserCourseProgress.AddAsync(userProgress);

            await _unitOfWork.SaveChangesAsync();
        }


    }

}