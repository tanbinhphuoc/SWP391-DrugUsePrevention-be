namespace DrugUsePreventionAPI.Models.DTOs.StatisticalCourse
{
    public class CourseUserStatisticsDto
    {
        public int CourseId { get; set; }
        public string CourseName { get; set; }
        public int TotalUsers { get; set; }
        public double CompletionRate { get; set; }
        public int UsersWithoutOutputAssessment { get; set; }
        public double AverageOutputScore { get; set; }
    }
}
