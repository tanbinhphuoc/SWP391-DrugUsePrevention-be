using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.DTOs.Question
{
    public class CreateQuestionForAssessmentDto
    {
        public int assessmentID { get; set; }
        public string questionText { get; set; }

        public string questionType { get; set; }

    }
}
