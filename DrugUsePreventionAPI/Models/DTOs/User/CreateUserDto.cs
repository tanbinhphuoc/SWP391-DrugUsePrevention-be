using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.DTOs.User
{
    public class CreateUserDto
    {
        [Required]
        [StringLength(100)]
        public string UserName { get; set; }

        [Required]
        [StringLength(255, MinimumLength = 6)]
        public string Password { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [StringLength(150)]
        public string? FullName { get; set; }

        public DateTime? DateOfBirth { get; set; }

        [Phone]
        public string? Phone { get; set; }

        [StringLength(255)]
        public string? Address { get; set; }
    }
}
