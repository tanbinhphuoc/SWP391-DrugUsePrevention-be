using DrugUsePreventionAPI.Models.Entities;
using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class Survey
    {
        [Key]
        public int SurveyID { get; set; }

        [Required]
        [MaxLength(255)]
        public string Title { get; set; }

        [MaxLength(50)]
        public string? Type { get; set; }

        [Required]
        public int AuthorID { get; set; }

        public string? Description { get; set; }

        // Navigation properties
        public virtual User Author { get; set; }
        public virtual ICollection<Question> Questions { get; set; }
        public virtual ICollection<SurveyResponse> SurveyResponses { get; set; }
    }
}
