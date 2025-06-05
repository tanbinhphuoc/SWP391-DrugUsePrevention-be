using DrugPreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles = "Admin")]
    public class AdminController : ControllerBase
    {
        private readonly IUserService _userService;
        private readonly IConsultantService _consultantService;
        private readonly IAuthService _authService;

        public AdminController(IUserService userService, IConsultantService consultantService, IAuthService authService)
        {
            _userService = userService;
            _consultantService = consultantService;
            _authService = authService;
        }

        [HttpGet("users/{id}")]
        public async Task<IActionResult> GetUser(int id)
        {
            var user = await _userService.GetUserByIdAsync(id);
            if (user == null)
                return NotFound();
            return Ok(user);
        }

        [HttpPost("create-consultant")]
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
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "An unexpected error occurred while creating the consultant." });
            }
        }


        [HttpGet("consultant/{id}")]
        public async Task<IActionResult> GetConsultant(int id)
        {
            var consultant = await _consultantService.GetConsultantByIdAsync(id);
            if (consultant == null)
                return NotFound();

            return Ok(consultant);
        }


        [HttpPut("consultant/{id}")]
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
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "An unexpected error occurred while updating the consultant." });
            }
        }

        [HttpDelete("consultant/{id}")]
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
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "An unexpected error occurred while deleting the consultant." });
            }
        }
    }
}