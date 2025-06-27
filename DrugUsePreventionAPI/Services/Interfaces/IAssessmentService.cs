using DrugUsePreventionAPI.Models.DTOs.AssessmentDto;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IAssessmentService
    {
        Task<string> CreateAssessment(CreateAssessmentDto assessmentDto);

        Task<List<Assessment>> GetAllAssessment();
        Task<List<Course>> GetAvailableCourses();
        Task<bool> UpdateAssessment(int id, CreateAssessmentDto assessmentDto);
        Task<bool> DeleteAssessment(int id);
        Task<List<Assessment>> GetAssessmentByAge(int age);
        Task<GetAssessmentDto?> GetAssessmentById(int id);

    }
}
