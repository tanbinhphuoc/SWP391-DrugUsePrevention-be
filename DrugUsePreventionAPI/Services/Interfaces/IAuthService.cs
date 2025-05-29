using DrugUsePreventionAPI.Models.DTOs.Auth;


namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IAuthService
    {
        Task<TokenDto> LoginAsync(LoginDto loginDto);
        Task<TokenDto> RegisterAsync(RegisterDto registerDto);
    }
}
