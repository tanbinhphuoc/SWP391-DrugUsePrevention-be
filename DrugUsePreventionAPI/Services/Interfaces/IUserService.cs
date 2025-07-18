using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.DTOs.Consultant;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IUserService
    {
        Task<IEnumerable<UserDto>> GetAllUsersAsync();
        Task<IEnumerable<UserDto>> GetAllMemberAsync();
        Task<UserDto> GetUserByIdAsync(int id);
        Task<UserDto> CreateUserAsync(CreateUserDto createUserDto);
        Task<UserDto> UpdateUserAsync(int id, UpdateUserDto updateUserDto);
        Task<bool> DeleteUserAsync(int id);
        Task<UserDto> UpdateUserRoleAsync(int id, string roleName, string callerRole);
        Task<IEnumerable<UserDto>> GetUsersByRoleAsync(string roleName);
        Task<IEnumerable<UserDto>> GetUsersByStatusAsync(string status);
        Task<IEnumerable<UserDto>> GetUsersByCreatedDateRangeAsync(DateTime startDate, DateTime endDate);
        Task<IEnumerable<UserDto>> SearchUsersAsync(string searchTerm);
        Task<int> GetUserCountByRoleAsync(string roleName);
        Task<int> GetNewUserCountAsync(DateTime startDate);
        Task<Dictionary<string, int>> GetActiveInactiveRatioAsync();
        Task<bool> ToggleUserStatusAsync(int id, string newStatus);
        Task<UserDto> UpdateUserProfileAsync(int userId, UpdateUserProfileDto updateUserProfileDto);

        Task<UserDto> UpdateUserPasswordAsync(int userId, UpdatePasswordDto updatePasswordDto);
        Task<MemberProfileDto> GetMemberProfileAsync(int userId);

        Task<MemberProfileForConsultantDto> GetMemberProfileForConsultantAsync(int userId);
    }
}