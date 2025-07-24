using DrugUsePreventionAPI.Exceptions;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Serilog;
using System;
using System.Security.Claims;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConsultantController : ControllerBase
    {
        private readonly IConsultantService _consultantService;
        private readonly IUnitOfWork _unitOfWork;

        public ConsultantController(IConsultantService consultantService, IUnitOfWork unitOfWork)
        {
            _consultantService = consultantService ?? throw new ArgumentNullException(nameof(consultantService));
            _unitOfWork = unitOfWork ?? throw new ArgumentNullException(nameof(unitOfWork));
        }

        [HttpPost("createConsultant(Admin)")]
        [Authorize(Roles = "Admin,Manager")]
        public async Task<IActionResult> CreateConsultant([FromBody] CreateConsultantDto createConsultantDto)
        {
            try
            {
                var consultant = await _consultantService.CreateConsultantAsync(createConsultantDto);
                return CreatedAtAction(nameof(GetConsultant), new { id = consultant.ConsultantID }, new
                {
                    success = true, 
                    message = "Consultant created successfully.",
                    data = new { consultantID = consultant.ConsultantID, consultant } 
                });
            }
            catch (InvalidOperationException ex)
            {
                Serilog.Log.Error(ex, "Failed to create consultant: {Message}", ex.Message);
                return BadRequest(new { success = false, message = ex.Message });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Unexpected error occurred while creating the consultant: {Message}", ex.Message);
                return StatusCode(500, new { success = false, message = "An unexpected error occurred while creating the consultant." });
            }
        }

        [HttpGet("{id}GetConsultantByID")]
        [Authorize(Roles = "Admin,Manager")]
        public async Task<IActionResult> GetConsultant(int id)
        {
            var consultant = await _consultantService.GetConsultantByIdAsync(id);
            if (consultant == null)
                return NotFound();

            return Ok(consultant);
        }

        [HttpPatch("{id}")]
        [Authorize(Roles = "Admin,Manager")]
        public async Task<IActionResult> UpdateConsultant(int id, [FromBody] AdminUpdateConsultantDto updateConsultantDto)
        {
            try
            {
                var consultant = await _consultantService.UpdateConsultantAsync(id, updateConsultantDto);
                return Ok(new
                {
                    message = "Consultant updated successfully.",
                    consultant
                });
            }
            catch (EntityNotFoundException ex)
            {
                Serilog.Log.Warning(ex, "Consultant with ID {ConsultantId} not found", id);
                return NotFound(new { message = ex.Message });
            }
            catch (DuplicateEntityException ex)
            {
                Serilog.Log.Warning(ex, "Duplicate entity: {Message}", ex.Message);
                return BadRequest(new { message = ex.Message });
            }
            catch (InvalidOperationException ex)
            {
                Serilog.Log.Error(ex, "Invalid operation: {Message}", ex.Message);
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Unexpected error occurred while updating consultant: {Message}", ex.Message);
                return StatusCode(500, new { message = "An unexpected error occurred while updating the consultant." });
            }
        }

        [HttpDelete("{id}DeleteConsultant")]
        [Authorize(Roles = "Admin,Manager")]
        public async Task<IActionResult> DeleteConsultant(int id)
        {
            try
            {
                var success = await _consultantService.DeleteConsultantAsync(id);
                if (!success)
                    return NotFound(new { message = "Consultant không tồn tại." });
                return NoContent();
            }
            catch (InvalidOperationException ex)
            {
                Serilog.Log.Error(ex, "Failed to delete consultant: {Message}", ex.Message);
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Unexpected error occurred while deleting the consultant: {Message}", ex.Message);
                return StatusCode(500, new { message = "An unexpected error occurred while deleting the consultant." });
            }
        }

        [HttpPut("UpdateConsultantByConsultant")]
        [Authorize(Roles = "Consultant")]
        public async Task<IActionResult> UpdateMyProfile([FromBody] UpdateConsultantDto updateConsultantDto)
        {
            try
            {
                // Retrieve user ID from token
                var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier);
                if (userIdClaim == null)
                {
                    Serilog.Log.Warning("No user ID claim found in token");
                    return Unauthorized(new { success = false, message = "Unauthorized access. No user ID claim found." });
                }

                if (!int.TryParse(userIdClaim.Value, out int userId))
                {
                    Serilog.Log.Warning("Invalid user ID format: {UserIdClaim}", userIdClaim.Value);
                    return BadRequest(new { success = false, message = "Invalid user ID format." });
                }

                // Check if the user is a consultant
                var consultant = await _unitOfWork.Consultants.GetByUserIdAsync(userId);
                if (consultant == null)
                {
                    Serilog.Log.Warning("UserID={UserID} is not a consultant", userId);
                    return NotFound(new { success = false, message = "User is not a consultant." });
                }

                // Prevent updating userName by Consultant
                if (updateConsultantDto.UserName != null)
                {
                    Serilog.Log.Warning("Consultant with UserID={UserID} attempted to update userName", userId);
                    return BadRequest(new { success = false, message = "Consultants are not allowed to update username." });
                }

                // Update consultant profile
                var updatedConsultant = await _consultantService.UpdateConsultantProfileAsync(userId, updateConsultantDto, false);

                // Return success response with updated consultant data
                return Ok(new { success = true, data = updatedConsultant });
            }
            catch (EntityNotFoundException ex)
            {
                Serilog.Log.Warning(ex, "Update profile failed for UserID={UserID}: {Message}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value, ex.Message);
                return NotFound(new { success = false, message = ex.Message });
            }
            catch (DuplicateEntityException ex)
            {
                Serilog.Log.Warning(ex, "Update profile failed for UserID={UserID}: {Message}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value, ex.Message);
                return BadRequest(new { success = false, message = ex.Message });
            }
            catch (UnauthorizedAccessException ex)
            {
                Serilog.Log.Warning(ex, "Unauthorized access for UserID={UserID}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
                return Unauthorized(new { success = false, message = ex.Message });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Error updating consultant profile for UserID={UserID}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
                return StatusCode(500, new { success = false, message = "An unexpected error occurred while updating the consultant profile." });
            }
        }

        [HttpGet("ConsultantGetProfile")]
        [Authorize(Roles = "Consultant")]
        public async Task<IActionResult> GetMyProfile()
        {
            try
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

                var consultantDto = await _consultantService.GetConsultantProfileAsync(userId);

                return Ok(new { success = true, data = consultantDto });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error fetching consultant profile");
                return StatusCode(500, new { success = false, message = "An unexpected error occurred while retrieving the consultant profile." });
            }
        }

        /*
        [HttpGet("GetMemberProfileForConsultant")]
        public async Task<IActionResult> GetMemberProfileForConsultant(int memberId)
        {
            var result = await _memberService.GetMemberProfileForConsultantAsync(memberId);
            return Ok(result);
        }

        */
    }
}