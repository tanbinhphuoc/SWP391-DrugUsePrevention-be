using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.DTOs.Auth
{
    public class LoginDto
    {
   
        public required string UserName { get; set; }
      
        public required string Password { get; set; }
    }
}
