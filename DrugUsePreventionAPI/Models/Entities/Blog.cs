using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class Blog
    {
        [Key]
        public int BlogID { get; set; }

        [Required]
        [MaxLength(255)]
        public string Title { get; set; }

        [Required]
        public string Content { get; set; }

        [Required]
        public int CreatedBy { get; set; }

        [Required]
        public DateTime PublishDate { get; set; }

        [Required]
        [MaxLength(10)]
        public string Status { get; set; } = "Active";

        public string? Thumbnail { get; set; }

        public string? AuthorAvatar { get; set; }

        // Navigation properties
        public virtual User CreatedByUser { get; set; }
    }
}
