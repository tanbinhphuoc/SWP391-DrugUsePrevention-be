using DrugUsePreventionAPI.Models.DTOs.CourseRegistration;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface ICourseRegistrationService
    {
        Task CreateCourseRegistrationAsync(CreateCourseRegistrationDto createCourseRegistrationDto);

    }
}
