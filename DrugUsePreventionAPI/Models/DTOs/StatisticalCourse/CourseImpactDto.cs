namespace DrugUsePreventionAPI.Models.DTOs.StatisticalCourse
{
    public class CourseImpactDto
    {
        public int CourseId { get; set; }
        public string CourseName { get; set; }
        public double AverageScoreImprovement { get; set; }
    }
}
