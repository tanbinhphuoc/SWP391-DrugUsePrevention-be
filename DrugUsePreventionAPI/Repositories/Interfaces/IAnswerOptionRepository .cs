using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Repositories.Interfaces { 
    public interface IAnswerOptionRepository : IGenericRepository<AnswerOption> 
    {
        Task<List<AnswerOption>> GetByQuestionIdAsync(int questionId);
    } 
}