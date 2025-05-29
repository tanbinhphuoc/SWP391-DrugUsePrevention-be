namespace DrugUsePreventionAPI.Models.DTOs.Auth
{
    public class TokenDto
    {
        public required string Token { get; set; }
        public DateTime ExpiresAt { get; set; }
        public required string UserName { get; set; }
        public required string Email { get; set; }
    }
}
