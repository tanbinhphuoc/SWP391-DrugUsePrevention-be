using DrugUsePreventionAPI.Models.Entities;
using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class Question
    {
        [Key]
        public int QuestionID { get; set; }

        [Required]
        public int SurveyID { get; set; }

        [Required]
        public string QuestionText { get; set; }

        [MaxLength(50)]
        public string? QuestionType { get; set; }

        // Navigation properties
        public virtual Survey Survey { get; set; }
        public virtual ICollection<AnswerOption> AnswerOptions { get; set; }
    }
}