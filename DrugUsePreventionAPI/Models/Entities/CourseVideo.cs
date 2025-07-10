namespace DrugUsePreventionAPI.Models.Entities
{
    public class CourseVideo
    {
        public int ID { get; set; }
        public int CourseID { get; set; }
        public string Title { get; set; }
        public string VideoUrl { get; set; }
        public string Description { get; set; }
        public int Order { get; set; }

        // Navigation
        public Course Course { get; set; }
    }

}
