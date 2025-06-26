using DrugUsePreventionAPI.Models.Entities;
using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class Course
    {

        [Key]
        public int CourseID { get; set; }

        [Required]
        [MaxLength(255)]
        public required string Title { get; set; }

        public string? Description { get; set; }

        [Required]
        public DateTime StartDate { get; set; }

        [Required]
        public DateTime EndDate { get; set; }
        public required string Type { get; set; } = "HocSinh";//"SinhVien", "PhuHuynh";
        [Required]
        [MaxLength(10)]
        public string Status { get; set; } = "OPEN"; //"CLOSED" , "PENDING";   

        [Required]
        public int AgeMin { get; set; }

        public int? AgeMax { get; set; }

        public int? Capacity { get; set; }

        public decimal Price { get; set; } = 0;

        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public DateTime UpdatedAt { get; set; } = DateTime.Now;
        public bool IsDeleted { get; set; } = false;


        // Navigation properties
        public virtual ICollection<CourseRegistration> CourseRegistrations { get; set; } = new HashSet<CourseRegistration>();
        public virtual ICollection<CourseAssessment> CourseAssessments { get; set; } = new HashSet<CourseAssessment>();
        public virtual ICollection<Payment> Payments { get; set; } = new HashSet<Payment>();
    }
}