using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class AnswerOption
    {
        [Key]
        public int OptionID { get; set; }

        [Required]
        public int  QuestionID { get; set; }

       
        public required string OptionText { get; set; }

        public int? ScoreValue { get; set; }

        public virtual  Question Question { get; set; }
    }
}