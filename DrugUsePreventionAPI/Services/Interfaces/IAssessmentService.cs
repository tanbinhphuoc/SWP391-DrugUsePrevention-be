using DrugUsePreventionAPI.Models.DTOs.AssessmentDto;
using DrugUsePreventionAPI.Models.DTOs.Course;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IAssessmentService
    {
        Task<bool> CreateAssessment(CreateAssessmentDto assessmentDto);
        Task<List<Assessment>> GetAllAssessment();
        Task<Assessment?> GetAssessmentById(int id);
        Task<bool> UpdateAssessment(int id, CreateAssessmentDto assessmentDto);
        Task<bool> DeleteAssessment(int id);
    }
}
