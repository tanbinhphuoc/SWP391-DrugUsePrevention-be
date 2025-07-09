namespace DrugUsePreventionAPI.Models.DTOs.Course
{
    public class CourseVideoDto
    {
        public int CourseID { get; set; }
        public string Title { get; set; }
        public string VideoUrl { get; set; }
        public string Description { get; set; }
        public int Order { get; set; }
    }

}
