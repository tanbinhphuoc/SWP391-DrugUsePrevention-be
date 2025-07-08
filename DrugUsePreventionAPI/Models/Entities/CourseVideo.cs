using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class CourseVideo
    {
        [Key]
        public int VideoID { get; set; }

        [Required]
        public int CourseID { get; set; }

        [Required, MaxLength(200)]
        public string Title { get; set; }

        [Required]
        public string VideoUrl { get; set; }

        public int DurationInSeconds { get; set; }

        [ForeignKey("CourseID")]
        public Course Course { get; set; }

        public ICollection<UserVideoProgress> UserProgresses { get; set; }
    }
}