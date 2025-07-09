namespace DrugUsePreventionAPI.Models.Entities
{
    public class UserCourseProgress
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int CourseID { get; set; }
        public bool IsCompleted { get; set; }
        public DateTime? CompletedAt { get; set; }

        // Navigation
        public Course Course { get; set; }
    }

}
