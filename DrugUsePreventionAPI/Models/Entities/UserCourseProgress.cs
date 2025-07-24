using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class UserCourseProgress
    {
        [Key]
        public int UserCourseProgressesID { get; set; }
        public int UserID { get; set; }
        public int CourseID { get; set; }
        public bool IsCompleted { get; set; }
        public DateTime? CompletedAt { get; set; }

        // Navigation
        public Course Course { get; set; }
        public User User { get; set; }
    }

}
