using DrugUsePreventionAPI.Models.DTOs.Assessment;
using DrugUsePreventionAPI.Models.DTOs.AssessmentDto;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IAssessmentService
    {
        Task<(bool IsSuccess, string Message, int? AssessmentId)> CreateInputAssessment(CreateInputAssessmentDto dto);
        Task<(bool IsSuccess, string Message, int? AssessmentId)> CreateOutputAssessment(CreateOutputAssessmentDto dto);

        Task<List<GetAssessmentListDto>> GetAllAssessmentWithCourse();

        Task<List<Course>> GetAvailableCourses();
        Task<bool> UpdateAssessment(int id, CreateAssessmentDto assessmentDto);
        Task<bool> DeleteAssessment(int id);
        Task<List<Assessment>> GetAssessmentByAge(int age);
        Task<GetAssessmentDto?> GetAssessmentById(int id);

    }
}
