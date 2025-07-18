﻿using DrugUsePreventionAPI.Models.DTOs.Assessment;
using DrugUsePreventionAPI.Models.DTOs.AssessmentDto;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IAssessmentService
    {
        Task<(bool IsSuccess, string Message, int? AssessmentId)> CreateInputAssessment(CreateInputAssessmentDto dto);
        Task<(bool IsSuccess, string Message, int? AssessmentId)> CreateOutputAssessment(CreateOutputAssessmentDto dto);
        Task<List<GetAssessmentInputDto>> GetAllAssessmentInput();
        Task<List<GetAssessmentOutputDto>> GetAllAssessmentOutput();
        Task<List<Course>> GetAvailableCourses();
        Task<bool> UpdateInputAssessmentWithValidation(int id, CreateInputAssessmentDto dto);
        Task<(bool IsSuccess, string Message)> UpdateOutputAssessmentWithValidation(int id, CreateOutputAssessmentDto dto);
        Task<bool> DeleteAssessment(int id);
        Task<List<Assessment>> GetAssessmentByAge(int age);
        Task<GetAssessmentInputDto?> GetInputAssessmentById(int id);
        Task<GetAssessmentOutputDto?> GetOutputAssessmentById(int id);
    }
}
