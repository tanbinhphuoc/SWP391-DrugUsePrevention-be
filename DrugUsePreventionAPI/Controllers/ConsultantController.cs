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
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> CreateConsultant([FromBody] CreateConsultantDto createConsultantDto)
        {
            try
            {
                var consultant = await _consultantService.CreateConsultantAsync(createConsultantDto);
                return CreatedAtAction(nameof(GetConsultant), new { id = consultant.ConsultantID }, new
                {
                    message = "Consultant created successfully.",
                    consultant = consultant
                });
            }
            catch (InvalidOperationException ex)
            {
                Serilog.Log.Error(ex, "Failed to create consultant: {Message}", ex.Message);
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Unexpected error occurred while creating the consultant: {Message}", ex.Message);
                return StatusCode(500, new { message = "An unexpected error occurred while creating the consultant." });
            }
        }

        [HttpGet("{id}GetConsultantByID")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetConsultant(int id)
        {
            var consultant = await _consultantService.GetConsultantByIdAsync(id);
            if (consultant == null)
                return NotFound();

            return Ok(consultant);
        }

        [HttpPut("{id}UpdateConsultant")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> UpdateConsultant(int id, [FromBody] UpdateConsultantDto updateConsultantDto)
        {
            try
            {
                var consultant = await _consultantService.UpdateConsultantAsync(id, updateConsultantDto);
                if (consultant == null)
                    return NotFound(new { message = "Consultant not found." });

                return Ok(new
                {
                    message = "Consultant updated successfully.",
                    consultant = consultant
                });
            }
            catch (InvalidOperationException ex)
            {
                Serilog.Log.Error(ex, "Failed to update consultant: {Message}", ex.Message);
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Unexpected error occurred while updating the consultant: {Message}", ex.Message);
                return StatusCode(500, new { message = "An unexpected error occurred while updating the consultant." });
            }
        }

        [HttpDelete("{id}DeleteConsultant")]
        [Authorize(Roles = "Admin")]
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
                var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier);
                if (userIdClaim == null)
                {
                    Log.Warning("No user ID claim found in token");
                    return Unauthorized(new { success = false, message = "Unauthorized access." });
                }

                if (!int.TryParse(userIdClaim.Value, out int userId))
                {
                    Log.Warning("Invalid user ID format: {UserIdClaim}", userIdClaim.Value);
                    return BadRequest(new { success = false, message = "Invalid user ID format." });
                }

                var consultant = await _unitOfWork.Consultants.GetByUserIdAsync(userId);
                if (consultant == null)
                {
                    Log.Warning("UserID={UserID} is not a consultant", userId);
                    return NotFound(new { success = false, message = "User is not a consultant." });
                }

                var updatedConsultant = await _consultantService.UpdateConsultantProfileAsync(userId, updateConsultantDto, false);
                return Ok(new { success = true, data = updatedConsultant });
            }
            catch (EntityNotFoundException ex)
            {
                Log.Warning(ex, "Update profile failed for UserID={UserID}: {Message}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value, ex.Message);
                return NotFound(new { success = false, message = ex.Message });
            }
            catch (DuplicateEntityException ex)
            {
                Log.Warning(ex, "Update profile failed for UserID={UserID}: {Message}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value, ex.Message);
                return BadRequest(new { success = false, message = ex.Message });
            }
            catch (UnauthorizedAccessException ex)
            {
                Log.Warning(ex, "Unauthorized access for UserID={UserID}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
                return Unauthorized(new { success = false, message = ex.Message });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error updating consultant profile for UserID={UserID}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
                return StatusCode(500, new { success = false, message = "An unexpected error occurred while updating consultant profile." });
            }
        }
    }
}