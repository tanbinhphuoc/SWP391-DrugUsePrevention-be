using DrugUsePreventionAPI.Models.DTOs.Auth;
using DrugUsePreventionAPI.Models.DTOs.User;


namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IAuthService
    {
        Task<UserDto> CreateUserByAdminAsync(CreateUserByAdminDto dto);
        Task<TokenDto> LoginAsync(LoginDto loginDto);
        Task<TokenDto> RegisterAsync(RegisterDto registerDto, string? callerRole);
        Task<TokenDto> RegisterAsync(RegisterDto registerDto);
    }
}
