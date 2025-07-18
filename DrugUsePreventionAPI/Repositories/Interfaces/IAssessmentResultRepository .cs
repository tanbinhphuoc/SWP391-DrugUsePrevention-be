﻿using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Repositories.Interfaces { 
    public interface IAssessmentResultRepository : IGenericRepository<AssessmentResult> {
        Task<AssessmentResult> GetByUserAndCourseAsync(int userId, int courseId, string stage);
        Task<AssessmentResult?> GetLatestResultByUserAsync(int userId);
        Task<AssessmentResult> GetAssessmentResultByUserAsync(int userId, string assessmentStage);
        Task<IEnumerable<AssessmentResult>> GetByUserIdAsync(int userId);
    }
}