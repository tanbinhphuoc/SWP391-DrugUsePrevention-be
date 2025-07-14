using DrugUsePreventionAPI.Models.DTOs.CourseRegistration;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using DrugUsePreventionAPI.Exceptions;
using DrugUsePreventionAPI.Services.Implementations;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseRegistrationController : ControllerBase
    {
        private readonly ICourseRegistrationService _service;

        public CourseRegistrationController(ICourseRegistrationService service)
        {
            _service = service;
        }

        [HttpPost("register")]
        [Authorize(Roles = "Member")]
        public async Task<IActionResult> RegisterCourse([FromBody] RegisterCourseDto dto)
        {
            int userId = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
            var (registration, paymentUrl) = await _service.RegisterCourseAsync(dto, userId, HttpContext.Connection.RemoteIpAddress.ToString(), HttpContext);
            return Ok(new { success = true, registration, paymentUrl });
        }

        [HttpPost("confirm")]
        public async Task<IActionResult> ConfirmCourseRegistration(
    [FromQuery] int courseRegistrationId,
    [FromQuery] string transactionId,
    [FromQuery] string vnp_ResponseCode)
        {
            try
            {
                var result = await _service.ConfirmPaymentAsync(courseRegistrationId, transactionId, vnp_ResponseCode, HttpContext);
                return Ok(new
                {
                    success = true,
                    message = "Xác nhận thanh toán thành công",
                    data = result
                });
            }
            catch (BusinessRuleViolationException ex)
            {
                Serilog.Log.Warning("Xác nhận thanh toán thất bại (Business Rule): {Message}", ex.Message);
                return BadRequest(new { success = false, message = ex.Message });
            }
            catch (EntityNotFoundException ex)
            {
                Serilog.Log.Warning("Không tìm thấy bản ghi CourseRegistration: {Message}", ex.Message);
                return NotFound(new { success = false, message = ex.Message });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Lỗi xác nhận thanh toán");
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi khi xác nhận thanh toán." });
            }
        }


        [HttpGet("user")]
        [Authorize(Roles = "Member")]
        public async Task<IActionResult> GetMyRegistrations()
        {
            int userId = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
            var data = await _service.GetUserRegistrationsAsync(userId);
            return Ok(new { success = true, data });
        }
    }

}
