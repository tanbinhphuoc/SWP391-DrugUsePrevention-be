﻿namespace DrugUsePreventionAPI.Models.DTOs.AssessmentDto
{
    public class GetAssessmentListDto
    {
        public int AssessmentID { get; set; }
        public string AssessmentName { get; set; }
        public string AssessmentType { get; set; }
        public string AssessmentStage { get; set; }
        public string? Description { get; set; }
        public int? MinAge { get; set; }
        public int? MaxAge { get; set; }
        public int? CourseID { get; set; } // chỉ có nếu là Output
    }
}
