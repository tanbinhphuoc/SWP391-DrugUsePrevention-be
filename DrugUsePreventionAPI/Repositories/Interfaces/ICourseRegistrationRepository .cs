using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Repositories.Interfaces { 
    public interface ICourseRegistrationRepository : IGenericRepository<CourseRegistration> {
        Task<bool> ExistsAsync(int userId, int courseId); 
    }
}