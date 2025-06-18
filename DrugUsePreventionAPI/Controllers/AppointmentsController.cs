using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Serilog;
using System.Security.Claims;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class AppointmentsController : ControllerBase
    {
        private readonly IAppointmentService _appointmentService;
        private readonly IUnitOfWork _unitOfWork;

        public AppointmentsController(IAppointmentService appointmentService, IUnitOfWork unitOfWork)
        {
            _appointmentService = appointmentService;
            _unitOfWork = unitOfWork;
        }

        [HttpGet("consultants")]
        [AllowAnonymous]
        public async Task<IActionResult> GetAvailableConsultants()
        {
            try
            {
                var consultants = await _appointmentService.GetAvailableConsultantsAsync();
                return Ok(consultants);
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving available consultants");
                return StatusCode(500, new { message = "An error occurred while retrieving consultants." });
            }
        }

        [HttpGet("consultants/{consultantId}/schedules")]
        [AllowAnonymous]
        public async Task<IActionResult> GetConsultantSchedules(int consultantId, [FromQuery] DateTime startDate, [FromQuery] DateTime endDate)
        {
            try
            {
                if (endDate < startDate)
                    return BadRequest(new { message = "End date must be after start date." });

                var schedules = await _appointmentService.GetConsultantSchedulesAsync(consultantId, startDate, endDate);
                return Ok(schedules);
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving schedules for ConsultantID={ConsultantId}", consultantId);
                return StatusCode(500, new { message = "An error occurred while retrieving schedules." });
            }
        }

        [HttpPost("book")]
        [Authorize(Roles = "Member,Guest")]
        public async Task<IActionResult> BookAppointment([FromBody] BookAppointmentDto dto)
        {
            try
            {
                var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier);
                Log.Information("UserIdClaim from token: {UserIdClaim}", userIdClaim?.Value);
                if (userIdClaim == null)
                {
                    return Unauthorized();
                }
                var userId = int.Parse(userIdClaim.Value);
                Log.Information("Parsed UserID: {UserID}", userId);

                var (appointment, paymentUrl) = await _appointmentService.BookAppointmentAsync(dto, userId);
                return Ok(new { Appointment = appointment, PaymentUrl = paymentUrl });
            }
            catch (InvalidOperationException ex)
            {
                Log.Warning("Booking failed: {Message}", ex.Message);
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error booking appointment for UserID={UserID}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
                return StatusCode(500, new { message = "An error occurred while booking the appointment." });
            }
        }

        [HttpPost("{appointmentId}/confirm-payment")]
        [Authorize(Roles = "Member,Guest")]
        public async Task<IActionResult> ConfirmPayment(int appointmentId, [FromBody] ConfirmPaymentDto confirmDto)
        {
            try
            {
                var appointment = await _appointmentService.ConfirmPaymentAsync(appointmentId, confirmDto.TransactionID, confirmDto.VNPayResponseCode);
                return Ok(appointment);
            }
            catch (InvalidOperationException ex)
            {
                Log.Warning("Payment confirmation failed: {Message}", ex.Message);
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error confirming payment for AppointmentID={AppointmentID}", appointmentId);
                return StatusCode(500, new { message = "An error occurred while confirming payment." });
            }
        }

        [HttpGet("my-appointments")]
        [Authorize(Roles = "Member,Guest")]
        public async Task<IActionResult> GetMyAppointments()
        {
            try
            {
                var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier);
                if (userIdClaim == null)
                {
                    return Unauthorized();
                }
                var userId = int.Parse(userIdClaim.Value);
                var appointments = await _appointmentService.GetUserAppointmentsAsync(userId);
                return Ok(appointments);
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving appointments for UserID={UserID}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
                return StatusCode(500, new { message = "An error occurred while retrieving appointments." });
            }
        }

        [HttpGet("consultant-appointments")]
        [Authorize(Roles = "Consultant")]
        public async Task<IActionResult> GetConsultantAppointments()
        {
            try
            {
                var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier);
                if (userIdClaim == null)
                {
                    return Unauthorized();
                }
                var userId = int.Parse(userIdClaim.Value);

                var consultant = await _unitOfWork.Consultants.GetByUserIdAsync(userId);
                if (consultant == null)
                {
                    Log.Warning("UserID={UserID} is not a consultant", userId);
                    return Forbid("User is not a consultant.");
                }

                var appointments = await _appointmentService.GetConsultantAppointmentsAsync(consultant.ConsultantID);
                return Ok(appointments);
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving consultant appointments for UserID={UserID}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
                return StatusCode(500, new { message = "An error occurred while retrieving consultant appointments." });
            }
        }
    }

}