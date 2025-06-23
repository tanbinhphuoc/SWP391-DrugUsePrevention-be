using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Repositories.Interfaces { 
    public interface IAssessmentResultRepository : IGenericRepository<AssessmentResult> {
        Task<AssessmentResult> GetByUserAndCourseAsync(int userId, int courseId, string stage);
        Task<AssessmentResult?> GetLatestResultByUserAsync(int userId);

    }
}