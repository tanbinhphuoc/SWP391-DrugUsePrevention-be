using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.DTOs.Auth
{
    public class RegisterDto
    {
        [StringLength(100)]
        public required string UserName { get; set; }

        [StringLength(255, MinimumLength = 6)]
        public required string Password { get; set; }

        [EmailAddress]
        public required string Email { get; set; }

        [StringLength(150)]
        public string? FullName { get; set; }

        public DateTime? DateOfBirth { get; set; } 

        [Phone]
        public string? Phone { get; set; }         

        [StringLength(255)]
        public string? Address { get; set; }

       
    }
}
