using DrugUsePreventionAPI.Configurations;
using DrugUsePreventionAPI.Models.DTOs.Auth;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class AuthService : IAuthService
    {
        private readonly IUnitOfWork _unitOfWork; private readonly JwtSettings _jwtSettings;

        public AuthService(IUnitOfWork unitOfWork, IOptions<JwtSettings> jwtSettings)
        {
            _unitOfWork = unitOfWork;
            _jwtSettings = jwtSettings.Value;
        }

        public async Task<TokenDto> LoginAsync(LoginDto loginDto)
        {
            var user = await _unitOfWork.Users.GetUserByUsernameAsync(loginDto.UserName);
            if (user == null || !BCrypt.Net.BCrypt.Verify(loginDto.Password, user.Password))
            {
                throw new UnauthorizedAccessException("Invalid username or password.");
            }

            return GenerateJwtToken(user);
        }

        public async Task<TokenDto> RegisterAsync(RegisterDto registerDto, string? callerRole)
        {
            if (await _unitOfWork.Users.UsernameExistsAsync(registerDto.UserName) ||
                await _unitOfWork.Users.EmailExistsAsync(registerDto.Email))
            {
                throw new InvalidOperationException("Username or email already exists.");
            }

            string assignedRoleName = callerRole ?? "Member";
            var role = await _unitOfWork.Roles.GetByNameAsync(assignedRoleName);
            if (role == null)
            {
                throw new InvalidOperationException($"Role '{assignedRoleName}' does not exist.");
            }

            var user = new User
            {
                UserName = registerDto.UserName,
                Password = BCrypt.Net.BCrypt.HashPassword(registerDto.Password),
                Email = registerDto.Email,
                FullName = registerDto.FullName,
                DateOfBirth = registerDto.DateOfBirth,
                Phone = registerDto.Phone,
                Address = registerDto.Address,
                RoleID = role.RoleID,
                Status = "Active",
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow
            };

            await _unitOfWork.Users.AddAsync(user);
            await _unitOfWork.SaveChangesAsync();
            user.Role = role;

            return GenerateJwtToken(user);
        }

        public async Task<UserDto> CreateUserByAdminAsync(CreateUserByAdminDto dto)
        {
            if (dto.RoleName == "Consultant")
            {
                throw new InvalidOperationException("Không tạo account cho Consultant ở đây.");
            }

            if (await _unitOfWork.Users.UsernameExistsAsync(dto.UserName) ||
                await _unitOfWork.Users.EmailExistsAsync(dto.Email))
            {
                throw new InvalidOperationException("Username or email already exists.");
            }

            var role = await _unitOfWork.Roles.GetByNameAsync(dto.RoleName);
            if (role == null)
            {
                throw new InvalidOperationException($"Role '{dto.RoleName}' does not exist.");
            }

            var user = new User
            {
                UserName = dto.UserName,
                Password = BCrypt.Net.BCrypt.HashPassword(dto.Password),
                Email = dto.Email,
                FullName = dto.FullName,
                DateOfBirth = dto.DateOfBirth,
                Phone = dto.Phone,
                Address = dto.Address,
                RoleID = role.RoleID,
                Status = "Active",
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow
            };

            await _unitOfWork.Users.AddAsync(user);
            await _unitOfWork.SaveChangesAsync();
            user.Role = role;

            return new UserDto
            {
                UserID = user.UserID,
                UserName = user.UserName,
                Email = user.Email,
                FullName = user.FullName,
                DateOfBirth = user.DateOfBirth,
                Phone = user.Phone,
                Address = user.Address,
                RoleName = role.RoleName,
                Status = user.Status,
                CreatedAt = user.CreatedAt,
                UpdatedAt = user.UpdatedAt
            };
        }

        private TokenDto GenerateJwtToken(User user)
        {
            var key = Encoding.UTF8.GetBytes(_jwtSettings.SecretKey);

            var claims = new List<Claim>
        {
            new Claim(ClaimTypes.NameIdentifier, user.UserID.ToString()),
            new Claim(ClaimTypes.Name, user.UserName),
            new Claim(ClaimTypes.Email, user.Email),
            new Claim(ClaimTypes.Role, user.Role.RoleName)
        };

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.UtcNow.AddMinutes(_jwtSettings.ExpireMinutes),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature),
                Issuer = _jwtSettings.Issuer,
                Audience = _jwtSettings.Audience
            };

            var tokenHandler = new JwtSecurityTokenHandler();
            var token = tokenHandler.CreateToken(tokenDescriptor);

            return new TokenDto
            {
                Token = tokenHandler.WriteToken(token),
                ExpiresAt = tokenDescriptor.Expires ?? DateTime.UtcNow,
                UserName = user.UserName,
                Email = user.Email,
                Role = user.Role.RoleName,
                UserId = user.UserID
            };
        }

        public async Task<TokenDto> RegisterAsync(RegisterDto registerDto)
        {
            return await RegisterAsync(registerDto, null);
        }
    }

}