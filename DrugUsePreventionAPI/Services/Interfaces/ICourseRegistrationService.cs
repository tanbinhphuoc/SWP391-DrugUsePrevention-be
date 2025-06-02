using DrugUsePreventionAPI.Models.DTOs.CourseRegistration;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface ICourseRegistrationService
    {
        Task CreateCourseRegistrationAsync(CreateCourseRegistrationDto createCourseRegistrationDto);

    }
}
