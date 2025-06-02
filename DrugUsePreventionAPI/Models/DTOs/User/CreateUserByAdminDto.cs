using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.DTOs.User
{
    public class CreateUserByAdminDto
    {
        [Required]
        public string UserName { get; set; }

        [Required]
        public string Password { get; set; }

        [Required]
        public string Email { get; set; }

        public string? FullName { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }

        [Required]
        public string RoleName { get; set; }
    }
}
