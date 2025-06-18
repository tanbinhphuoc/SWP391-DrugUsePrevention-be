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
                throw new Exception("Ban da dang ky khoa hoc nay!");
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