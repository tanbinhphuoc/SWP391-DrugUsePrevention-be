﻿using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.DTOs.User
{
    public class UpdateUserRoleDto
    {
        [Required]
        public string? RoleName { get; set; }
    }
}
