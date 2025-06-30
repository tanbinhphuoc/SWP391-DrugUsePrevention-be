using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Repositories.Interfaces { 
    public interface IQuestionRepository : IGenericRepository<Question> {
        Task<IEnumerable<Question>> GetBySurveyIdAsync(int surveyId);
        Task<IEnumerable<Question>> GetByAssessmentIdAsync(int assessmentId);
        Task SoftDeleteByAssessmentIdAsync(int assessmentId);

    }
}