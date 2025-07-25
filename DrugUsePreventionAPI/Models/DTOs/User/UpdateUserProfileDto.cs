using System.ComponentModel.DataAnnotations;
public class UpdateUserProfileDto
{
    [Required]
    public string UserName { get; set; } 

    public string? Password { get; set; } 

    public string? Email { get; set; }

    public string? FullName { get; set; }

    public DateTime? DateOfBirth { get; set; }

    public string? Phone { get; set; }

    public string? Address { get; set; }
}
