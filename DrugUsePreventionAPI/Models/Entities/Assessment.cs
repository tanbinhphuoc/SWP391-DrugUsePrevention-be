using DrugUsePreventionAPI.Models.Entities;
using System.ComponentModel.DataAnnotations;

public class Assessment
{
    [Key]
    public int AssessmentID { get; set; }

    [Required]
    [MaxLength(255)]
    public required string AssessmentName { get; set; }

    public string? Description { get; set; }

    [Required]
    [MaxLength(10)]
    public required string AssessmentType { get; set; }
    [Required]
    public string AssessmentStage { get; set; } = "Input"; // hoặc "Output" nếu dùng cho tạo output



    // chuyển đổi trạng thái không hoạt động khi deleted
    public bool IsDeleted { get; set; } = false;

    // Navigation properties
    public virtual ICollection<CourseAssessment> CourseAssessments { get; set; }
    public virtual ICollection<Question> Questions { get; set; }
    public virtual ICollection<AssessmentResult> AssessmentResults { get; set; }
}
