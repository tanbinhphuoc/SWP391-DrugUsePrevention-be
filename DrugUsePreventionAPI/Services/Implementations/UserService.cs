using AutoMapper;
using DrugUsePreventionAPI.Exceptions;
using DrugUsePreventionAPI.Models.DTOs.Consultant;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Services.Interfaces;
using Serilog;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class UserService : IUserService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public UserService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork ?? throw new ArgumentNullException(nameof(unitOfWork));
            _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
        }

        public async Task<IEnumerable<UserDto>> GetAllUsersAsync()
        {
            Log.Information("Retrieving all users");
            var users = await _unitOfWork.Users.GetAllWithRolesAsync();
            var result = _mapper.Map<IEnumerable<UserDto>>(users);
            Log.Information("Retrieved {Count} users", result.Count());
            return result;
        }

        public async Task<IEnumerable<UserDto>> GetAllMemberAsync()
        {
            Log.Information("Retrieving all Member");
            var users = await _unitOfWork.Users.GetAllWithMemberAsync();
            var result = _mapper.Map<IEnumerable<UserDto>>(users);
            Log.Information("Retrieved {Count} users", result.Count());
            return result;
        }

        public async Task<UserDto> GetUserByIdAsync(int id)
        {
            Log.Information("Retrieving user with ID {UserId}", id);
            var user = await _unitOfWork.Users.GetUserWithRoleAsync(id);
            if (user == null)
            {
                Log.Warning("User with ID {UserId} not found", id);
                throw new EntityNotFoundException("User", id);
            }
            var result = _mapper.Map<UserDto>(user);
            Log.Information("Retrieved user {UserName}", result.UserName);
            return result;
        }

        public async Task<UserDto> CreateUserAsync(CreateUserDto createUserDto)
        {
            Log.Information("Creating user with username {UserName}", createUserDto.UserName);
            if (await _unitOfWork.Users.UsernameExistsAsync(createUserDto.UserName))
            {
                Log.Warning("Username {UserName} already exists", createUserDto.UserName);
                throw new DuplicateEntityException("User", "Username", createUserDto.UserName);
            }
            if (await _unitOfWork.Users.EmailExistsAsync(createUserDto.Email))
            {
                Log.Warning("Email {Email} already exists", createUserDto.Email);
                throw new DuplicateEntityException("User", "Email", createUserDto.Email);
            }

            var user = _mapper.Map<User>(createUserDto);
            user.Password = BCrypt.Net.BCrypt.HashPassword(createUserDto.Password);
            user.CreatedAt = DateTime.UtcNow;
            user.UpdatedAt = DateTime.UtcNow;

            await _unitOfWork.Users.AddAsync(user);
            await _unitOfWork.SaveChangesAsync();

            var result = _mapper.Map<UserDto>(user);
            Log.Information("Created user {UserName} with ID {UserId}", result.UserName, result.UserID);
            return result;
        }

        public async Task<UserDto> UpdateUserAsync(int id, UpdateUserDto updateUserDto)
        {
            Log.Information("Updating user with ID {UserId}", id);
            var user = await _unitOfWork.Users.GetByIdAsync(id);
            if (user == null)
            {
                Log.Warning("User with ID {UserId} not found", id);
                throw new EntityNotFoundException("User", id);
            }

            _mapper.Map(updateUserDto, user);
            user.UpdatedAt = DateTime.UtcNow;

            _unitOfWork.Users.Update(user);
            await _unitOfWork.SaveChangesAsync();
            var result = _mapper.Map<UserDto>(user);
            Log.Information("Updated user {UserName}", result.UserName);
            return result;
        }

        public async Task<bool> DeleteUserAsync(int id)
        {
            Log.Information("Deleting user with ID {UserId}", id);
            var user = await _unitOfWork.Users.GetByIdAsync(id);
            if (user == null)
            {
                Log.Warning("User with ID {UserId} not found", id);
                return false;
            }

            _unitOfWork.Users.Remove(user);
            await _unitOfWork.SaveChangesAsync();
            Log.Information("Deleted user with ID {UserId}", id);
            return true;
        }

        public async Task<UserDto> UpdateUserRoleAsync(int id, string roleName, string callerRole)
        {
            Log.Information("Updating role for user ID {UserId} to {RoleName} by {CallerRole}", id, roleName, callerRole);
            if (callerRole == "Manager" && roleName == "Admin")
            {
                Log.Warning("Manager attempted to assign Admin role for user ID {UserId}", id);
                throw new BusinessRuleViolationException("Managers cannot assign Admin role.");
            }

            var role = await _unitOfWork.Roles.GetByNameAsync(roleName);
            if (role == null)
            {
                Log.Warning("Role {RoleName} not found", roleName);
                throw new BusinessRuleViolationException($"Role '{roleName}' does not exist.");
            }

            var user = await _unitOfWork.Users.GetUserWithRoleAsync(id);
            if (user == null)
            {
                Log.Warning("User with ID {UserId} not found", id);
                throw new EntityNotFoundException("User", id);
            }

            user.RoleID = role.RoleID;
            user.UpdatedAt = DateTime.UtcNow;
            _unitOfWork.Users.Update(user);
            await _unitOfWork.SaveChangesAsync();

            user.Role = role;
            var result = _mapper.Map<UserDto>(user);
            Log.Information("Updated role for user {UserName} to {RoleName}", result.UserName, roleName);
            return result;
        }

        public async Task<UserDto> UpdateUserProfileAsync(int userId, UpdateUserProfileDto updateUserProfileDto)
        {
            // Lấy người dùng theo ID
            var user = await _unitOfWork.Users.GetByIdAsync(userId);
            if (user == null)
            {
                throw new EntityNotFoundException("User", userId);
            }

            // Cập nhật các trường thông tin người dùng
            if (updateUserProfileDto.FullName != null)
                user.FullName = updateUserProfileDto.FullName;
            if (updateUserProfileDto.Phone != null)
                user.Phone = updateUserProfileDto.Phone;
            if (updateUserProfileDto.Address != null)
                user.Address = updateUserProfileDto.Address;
            if (updateUserProfileDto.DateOfBirth.HasValue)
                user.DateOfBirth = updateUserProfileDto.DateOfBirth;
            if (updateUserProfileDto.Email != null)
                user.Email = updateUserProfileDto.Email;

            // Cập nhật thời gian sửa đổi và lưu vào cơ sở dữ liệu
            user.UpdatedAt = DateTime.UtcNow;
            _unitOfWork.Users.Update(user);
            await _unitOfWork.SaveChangesAsync();

            var updatedUserDto = _mapper.Map<UserDto>(user);
            return updatedUserDto;
        }


        public async Task<UserDto> UpdateUserPasswordAsync(int userId, UpdatePasswordDto updatePasswordDto)
        {
            var user = await _unitOfWork.Users.GetByIdAsync(userId);
            if (user == null)
            {
                throw new EntityNotFoundException("User", userId);
            }

            // Kiểm tra mật khẩu cũ có đúng không
            if (!BCrypt.Net.BCrypt.Verify(updatePasswordDto.OldPassword, user.Password))
            {
                throw new BusinessRuleViolationException("Mật khẩu cũ không đúng.");
            }

            // Kiểm tra mật khẩu mới có hợp lệ không (ví dụ: độ dài, độ phức tạp)
            if (updatePasswordDto.NewPassword.Length < 8 ||
                !updatePasswordDto.NewPassword.Any(char.IsUpper) ||
                !updatePasswordDto.NewPassword.Any(char.IsDigit))
            {
                throw new BusinessRuleViolationException("Mật khẩu mới phải có ít nhất 8 ký tự, bao gồm chữ hoa và chữ số.");
            }

            // Kiểm tra mật khẩu mới và xác nhận mật khẩu mới có khớp không
            if (updatePasswordDto.NewPassword != updatePasswordDto.ConfirmNewPassword)
            {
                throw new BusinessRuleViolationException("Mật khẩu mới và xác nhận mật khẩu mới không khớp.");
            }

            // Cập nhật mật khẩu mới
            user.Password = BCrypt.Net.BCrypt.HashPassword(updatePasswordDto.NewPassword);
            user.UpdatedAt = DateTime.UtcNow;

            _unitOfWork.Users.Update(user);
            await _unitOfWork.SaveChangesAsync();

            var updatedUserDto = _mapper.Map<UserDto>(user);
            return updatedUserDto;
        }

        public async Task<IEnumerable<UserDto>> GetUsersByRoleAsync(string roleName)
        {
            Log.Information("Retrieving users by role {RoleName}", roleName);
            var users = await _unitOfWork.Users.GetUsersByRoleAsync(roleName);
            var result = _mapper.Map<IEnumerable<UserDto>>(users);
            Log.Information("Retrieved {Count} users for role {RoleName}", result.Count(), roleName);
            return result;
        }

        public async Task<IEnumerable<UserDto>> GetUsersByStatusAsync(string status)
        {
            Log.Information("Retrieving users by status {Status}", status);
            var users = await _unitOfWork.Users.GetUsersByStatusAsync(status);
            var result = _mapper.Map<IEnumerable<UserDto>>(users);
            Log.Information("Retrieved {Count} users with status {Status}", result.Count(), status);
            return result;
        }

        public async Task<IEnumerable<UserDto>> GetUsersByCreatedDateRangeAsync(DateTime startDate, DateTime endDate)
        {
            Log.Information("Retrieving users created between {StartDate} and {EndDate}", startDate, endDate);
            var users = await _unitOfWork.Users.GetUsersByCreatedDateRangeAsync(startDate, endDate);
            var result = _mapper.Map<IEnumerable<UserDto>>(users);
            Log.Information("Retrieved {Count} users", result.Count());
            return result;
        }

        public async Task<IEnumerable<UserDto>> SearchUsersAsync(string searchTerm)
        {
            Log.Information("Searching users with term {SearchTerm}", searchTerm);
            var users = await _unitOfWork.Users.SearchUsersAsync(searchTerm);
            var result = _mapper.Map<IEnumerable<UserDto>>(users);
            Log.Information("Retrieved {Count} users for search term {SearchTerm}", result.Count(), searchTerm);
            return result;
        }

        public async Task<int> GetUserCountByRoleAsync(string roleName)
        {
            Log.Information("Getting user count by role {RoleName}", roleName);
            var count = await _unitOfWork.Users.GetUserCountByRoleAsync(roleName);
            Log.Information("User count for role {RoleName} is {Count}", roleName, count);
            return count;
        }

        public async Task<int> GetNewUserCountAsync(DateTime startDate)
        {
            Log.Information("Getting new user count since {StartDate}", startDate);
            var count = await _unitOfWork.Users.GetNewUserCountAsync(startDate);
            Log.Information("New user count since {StartDate} is {Count}", startDate, count);
            return count;
        }

        public async Task<Dictionary<string, int>> GetActiveInactiveRatioAsync()
        {
            Log.Information("Getting active/inactive user ratio");
            var ratio = await _unitOfWork.Users.GetActiveInactiveRatioAsync();
            Log.Information("Active/Inactive ratio: Active={Active}%, Inactive={Inactive}%", ratio["Active"], ratio["Inactive"]);
            return ratio;
        }

        public async Task<MemberProfileDto> GetMemberProfileAsync(int userId)
        {
            Log.Information("Retrieving member profile for user ID {UserId}", userId);

            // Lấy thông tin người dùng và Role từ repository
            var user = await _unitOfWork.Users.GetUserWithRoleAsync(userId);
            if (user == null)
            {
                Log.Warning("User with ID {UserId} not found", userId);
                throw new EntityNotFoundException("User", userId);
            }

            // Lấy kết quả assessment stage "Input" nếu người dùng đã làm assessment
            var latestInputResult = await _unitOfWork.AssessmentResults.GetAssessmentResultByUserAsync(userId, "Input");

            var result = _mapper.Map<MemberProfileDto>(user);

            // Nếu đã làm assessment, thì cập nhật stage "Input"
            if (latestInputResult != null)
            {
                result.AssessmentStage = "Input"; // Chỉ hiển thị "Input" nếu người dùng đã thực hiện assessment ở stage này
            }

            Log.Information("Retrieved member profile for user {UserName}", user.UserName);
            return result;
        }

        public async Task<bool> ToggleUserStatusAsync(int id, string newStatus)
        {
            Log.Information("Toggling status for user ID {UserId} to {NewStatus}", id, newStatus);
            var user = await _unitOfWork.Users.GetByIdAsync(id);
            if (user == null)
            {
                Log.Warning("User with ID {UserId} not found", id);
                throw new EntityNotFoundException("User", id);
            }

            if (!new[] { "Active", "Inactive" }.Contains(newStatus))
            {
                Log.Warning("Invalid status {NewStatus} for user ID {UserId}", newStatus, id);
                throw new BusinessRuleViolationException("Status must be 'Active' or 'Inactive'.");
            }

            user.Status = newStatus;
            user.UpdatedAt = DateTime.UtcNow;
            _unitOfWork.Users.Update(user);
            await _unitOfWork.SaveChangesAsync();
            Log.Information("Toggled status for user {UserName} to {NewStatus}", user.UserName, newStatus);
            return true;
        }

       
    }
}