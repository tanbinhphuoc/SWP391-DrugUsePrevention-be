using DrugUsePreventionAPI.Models.Entities;
using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class Question
    {
        [Key]
        public int QuestionID { get; set; }

        public int? SurveyID { get; set; }

        [Required]
        public string QuestionText { get; set; }

        [MaxLength(50)]
        public string? QuestionType { get; set; }
        public int? AssessmentID { get; set; }

        // Navigation properties
        public virtual Assessment Assessment { get; set; }
        public virtual Survey Survey { get; set; }
        public virtual ICollection<AnswerOption> AnswerOptions { get; set; }
    }
}