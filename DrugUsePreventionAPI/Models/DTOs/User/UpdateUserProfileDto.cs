﻿using System.ComponentModel.DataAnnotations;
public class UpdateUserProfileDto
{
    public string? FullName { get; set; }
    public string? Phone { get; set; }
    public string? Address { get; set; }
    public DateTime? DateOfBirth { get; set; }
    public string? Email { get; set; } 
}
