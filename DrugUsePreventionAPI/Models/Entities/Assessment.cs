using DrugUsePreventionAPI.Models.Entities;
using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class Assessment
    {
        [Key]
        public int AssessmentID { get; set; }

        [Required]
        [MaxLength(255)]
        public string AssessmentName { get; set; }

        public string? Description { get; set; }

        [Required]
        [MaxLength(10)]
        public string AssessmentType { get; set; }



        public int? MinAge { get; set; }
        public int? MaxAge { get; set; }

        // Navigation properties
        public virtual ICollection<CourseAssessment> CourseAssessments { get; set; }
        public virtual ICollection<Question> Questions { get; set; }

        public virtual ICollection<AssessmentResult> AssessmentResults { get; set; }
    }
}