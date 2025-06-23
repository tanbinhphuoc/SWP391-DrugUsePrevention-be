using DrugUsePreventionAPI.Models.Entities;
using System.Collections.Generic;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface IAssessmentRepository : IGenericRepository<Assessment>
    {
        Task<List<Assessment>> GetAssessmentsByAgeAsync(int age);
        Task<Assessment> GetAssessmentWithQuestionsAsync(int id);

        // lấy các Assessment chưa bị xóa
        Task<List<Assessment>> GetAllActiveAssessmentsAsync();
    }
}
