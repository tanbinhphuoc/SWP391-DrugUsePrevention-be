using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class CourseVideo
    {
        [Key]
        public int VideoID { get; set; }
        public int CourseID { get; set; }
        public string Title { get; set; }
        public string VideoUrl { get; set; }
        public string Description { get; set; }

        // Navigation
        public Course Course { get; set; }
        public bool IsDeleted { get; set; } = false;
    }

}
