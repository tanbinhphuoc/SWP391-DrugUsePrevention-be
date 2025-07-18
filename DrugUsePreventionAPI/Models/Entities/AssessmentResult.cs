using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class AssessmentResult
    {
        [Key]
        public int ResultID { get; set; }

        [Required]
        public int UserID { get; set; }

        [Required]
        public int AssessmentID { get; set; }

        public int? CourseID { get; set; }

        [MaxLength(255)]
        public string? ResultName { get; set; }

        [Required]
        public double Score { get; set; }

        public DateTime TakeTime { get; set; } = DateTime.Now;
        public bool IsDeleted { get; set; } = false;


        // Navigation properties
        public virtual User User { get; set; }
        public virtual Assessment Assessment { get; set; }
        public virtual Course? Course { get; set; }
    }
}