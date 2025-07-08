using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class UserVideoProgress
    {
        [Key]
        public int ProgressID { get; set; }

        [Required]
        public int UserID { get; set; }

        [Required]
        public int VideoID { get; set; }

        public bool IsWatched { get; set; } = false;

        public DateTime? WatchedAt { get; set; }

        [ForeignKey("UserID")]
        public User User { get; set; }

        [ForeignKey("VideoID")]
        public CourseVideo Video { get; set; }
    }
}