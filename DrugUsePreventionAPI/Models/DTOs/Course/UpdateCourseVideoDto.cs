namespace DrugUsePreventionAPI.Models.DTOs.Course
{
    public class UpdateCourseVideoDto
    {
        public int VideoID { get; set; }
        public string Title { get; set; }
        public string VideoUrl { get; set; }
        public string Description { get; set; }
    }
}
