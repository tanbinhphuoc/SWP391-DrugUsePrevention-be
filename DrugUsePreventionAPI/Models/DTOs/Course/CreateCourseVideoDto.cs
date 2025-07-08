namespace DrugUsePreventionAPI.Models.DTOs.CourseVideo
{
    public class CreateCourseVideoDto
    {
        public int CourseID { get; set; }
        public string Title { get; set; }
        public string VideoUrl { get; set; }
        public int DurationInSeconds { get; set; }
    }
}