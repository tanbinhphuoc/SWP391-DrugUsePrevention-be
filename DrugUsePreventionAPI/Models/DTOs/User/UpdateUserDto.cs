using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.DTOs.User
{
    public class UpdateUserDto
    {
        [StringLength(150)]
        public string? FullName { get; set; }

        public DateTime? DateOfBirth { get; set; }

        [Phone]
        public string? Phone { get; set; }

        [StringLength(255)]
        public string? Address { get; set; }

        [StringLength(50)]
        public string? Status { get; set; }
    }
}
