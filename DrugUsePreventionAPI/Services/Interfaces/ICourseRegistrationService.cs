using DrugUsePreventionAPI.Models.DTOs.CourseRegistration;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface ICourseRegistrationService
    {
        Task<(CourseRegistrationDto registration, string paymentUrl)> RegisterCourseAsync(RegisterCourseDto dto, int userId, string clientIp, HttpContext context);
        Task<CourseRegistrationDto> ConfirmPaymentAsync(int courseRegistrationId, string transactionId, string responseCode, HttpContext context);
        Task<IEnumerable<CourseRegistrationDto>> GetUserRegistrationsAsync(int userId);
    }

}
