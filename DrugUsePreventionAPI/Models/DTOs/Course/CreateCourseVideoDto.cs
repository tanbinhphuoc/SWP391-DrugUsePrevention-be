namespace DrugUsePreventionAPI.Models.DTOs.Course
{
    public class CreateCourseVideoDto
    {
        public int CourseID { get; set; }
        public string Title { get; set; }
        public string VideoUrl { get; set; }
        public string Description { get; set; }
    }

}
