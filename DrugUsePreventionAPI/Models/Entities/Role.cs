using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class Role
    {
        [Key]
        public int RoleID { get; set; }

        [Required]
        [MaxLength(50)]
        public string RoleName { get; set; }

        public string? Description { get; set; }

        // Navigation properties
        public virtual ICollection<User> Users { get; set; }
    }
}