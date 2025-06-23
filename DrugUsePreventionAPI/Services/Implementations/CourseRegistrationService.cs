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
            if (course == null)
            {
                throw new Exception("Không tìm thấy khóa học.");
            }

            // Nếu khóa học đang ở trạng thái PENDING thì chuyển sang OPEN
            if (course.Status.ToUpper() == "PENDING")
            {
                course.Status = "OPEN";
                course.UpdatedAt = DateTime.UtcNow;
                _unitOfWork.Courses.Update(course);
            }

            var courseRegistration = new CourseRegistration
            {
                CourseID = createCourseRegistrationDto.courseID,
                UserID = createCourseRegistrationDto.userID,
                RegisterTime = DateTime.Now
            };

            await _unitOfWork.CourseRegistrations.AddAsync(courseRegistration);
            await _unitOfWork.SaveChangesAsync();
        }

    }

}