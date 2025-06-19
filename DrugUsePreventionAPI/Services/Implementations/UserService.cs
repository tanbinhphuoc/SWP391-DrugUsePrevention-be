using AutoMapper;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Exceptions;
using Serilog;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class UserService : IUserService
    {
        private readonly IUnitOfWork _unitOfWork; private readonly IMapper _mapper;

        public UserService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<IEnumerable<UserDto>> GetAllUsersAsync()
        {
            Log.Information("Retrieving all users");
            var users = await _unitOfWork.Users.GetAllWithRolesAsync();
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
    }

}