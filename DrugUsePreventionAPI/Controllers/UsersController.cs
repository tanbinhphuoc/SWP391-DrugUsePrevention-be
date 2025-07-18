using DrugUsePreventionAPI.Exceptions;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Serilog;
using System.Security.Claims;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
  
    public class UsersController : ControllerBase
    {
        private readonly IUserService _userService;

        public UsersController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpGet]
        [Authorize(Policy = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetAllUsers()
        {
            var users = await _userService.GetAllUsersAsync();
            return Ok(users);
        }

        [HttpGet("{id}GetAllUser")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetUser(int id)
        {
            var user = await _userService.GetUserByIdAsync(id);
            if (user == null)
                return NotFound();
            return Ok(user);
        }

        [HttpGet("GetProfileMember")]
        [Authorize(Roles = "Member,Staff")]
        public async Task<ActionResult<MemberProfileDto>> GetMemberProfile()
        {
            try
            {
                // Get userId from JWT claims
                var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
                if (!int.TryParse(userIdClaim, out int userId))
                {
                    return Unauthorized("Invalid user authentication");
                }

                var profile = await _userService.GetMemberProfileAsync(userId);
                return Ok(profile);
            }
            catch (EntityNotFoundException ex)
            {
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving member profile");
                return StatusCode(500, "An error occurred while processing your request");
            }
        }

        [HttpPut("{id}/AdminUpdateRole")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> UpdateUserRole(int id, [FromBody] UpdateUserRoleDto updateUserRoleDto)
        {
            try
            {
                var callerRole = User.FindFirst(ClaimTypes.Role)?.Value;
                var user = await _userService.UpdateUserRoleAsync(id, updateUserRoleDto.RoleName, callerRole);
                return Ok(user);
            }
            catch (UnauthorizedAccessException ex)
            {
                return Forbid(ex.Message);
            }
            catch (InvalidOperationException ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }


        [HttpPut("profile/UserUpdateProfile")]
        [Authorize(Roles = "Member")]
        public async Task<IActionResult> UpdateUserProfile([FromBody] UpdateUserProfileDto updateUserProfileDto)
        {

            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier);
            if (userIdClaim == null)
            {
                Log.Warning("No user ID claim found in token");
                return Unauthorized(new { success = false, message = "Unauthorized access. No user ID claim found." });
            }

            if (!int.TryParse(userIdClaim.Value, out int userId))
            {
                Log.Warning("Invalid user ID format: {UserIdClaim}", userIdClaim.Value);
                return BadRequest(new { success = false, message = "Invalid user ID format." });
            }

            try
            {

                var updatedUser = await _userService.UpdateUserProfileAsync(userId, updateUserProfileDto);
                return Ok(updatedUser);
            }
            catch (EntityNotFoundException)
            {
                return NotFound("User not found.");
            }
            catch (BusinessRuleViolationException ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }



        [HttpPut("{id}/AdminUpdateProfileUser")]
        [Authorize(Roles = "Admin,Staff")]
        public async Task<IActionResult> UpdateMemberProfile(int id, [FromBody] UpdateUserProfileDto updateUserProfileDto)
        {
            try
            {
                var updatedUser = await _userService.UpdateUserProfileAsync(id, updateUserProfileDto);
                return Ok(updatedUser);
            }
            catch (EntityNotFoundException)
            {
                return NotFound("User not found.");
            }
            catch (BusinessRuleViolationException ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpPut("profile/UserUpdatePassword")]
        [Authorize(Roles = "Member")]
        public async Task<IActionResult> UpdatePassword([FromBody] UpdatePasswordDto updatePasswordDto)
        {
            var userId = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
            try
            {
                var updatedUser = await _userService.UpdateUserPasswordAsync(userId, updatePasswordDto);
                return Ok(updatedUser);
            }
            catch (EntityNotFoundException)
            {
                return NotFound("User not found.");
            }
            catch (BusinessRuleViolationException ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        // Admin cập nhật mật khẩu của user
        [HttpPut("{id}/AdminUpdatePassword")]
        [Authorize(Roles = "Admin,Staff")]
        public async Task<IActionResult> UpdateMemberPassword(int id, [FromBody] UpdatePasswordDto updatePasswordDto)
        {
            try
            {
                var updatedUser = await _userService.UpdateUserPasswordAsync(id, updatePasswordDto);
                return Ok(updatedUser);
            }
            catch (EntityNotFoundException)
            {
                return NotFound("User not found.");
            }
            catch (BusinessRuleViolationException ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }


        [HttpGet("GetMemberProfileWithFullOption")]
        [Authorize(Roles = "Admin,Manager,Staff,Consultant")]
        public async Task<IActionResult> GetMemberProfileForConsultantAsync(int userId)
        {
            try
            {
                var profile = await _userService.GetMemberProfileForConsultantAsync(userId);
                return Ok(profile);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}

