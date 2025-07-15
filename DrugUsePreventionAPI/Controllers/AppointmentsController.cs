using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Serilog;
using System.Security.Claims;
using System.Text.Json;
using System.Threading.Tasks;

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
            _appointmentService = appointmentService ?? throw new ArgumentNullException(nameof(appointmentService));
            _unitOfWork = unitOfWork ?? throw new ArgumentNullException(nameof(unitOfWork));
        }

        [HttpGet("GetAllConsultant")]
        [AllowAnonymous]
        public async Task<IActionResult> GetAvailableConsultants()
        {
            try
            {
                var consultants = await _appointmentService.GetAvailableConsultantsAsync();
                return Ok(new { success = true, data = consultants });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving available consultants");
                return StatusCode(500, new { success = false, message = "An error occurred while retrieving consultants." });
            }
        }
        [HttpGet("{consultantId}/ConsultantSchedules")]
        [AllowAnonymous]
        public async Task<IActionResult> GetConsultantSchedules(int consultantId, [FromQuery] DateTime startDate, [FromQuery] DateTime endDate)
        {
            try
            {
                if (endDate < startDate)
                    return BadRequest(new { success = false, message = "End date must be after start date." });

                if (startDate < DateTime.UtcNow.Date)
                    return BadRequest(new { success = false, message = "Start date cannot be in the past." });

                var schedules = await _appointmentService.GetConsultantSchedulesAsync(consultantId, startDate, endDate);
                return Ok(new { success = true, data = schedules });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving schedules for ConsultantID={ConsultantId}", consultantId);
                return StatusCode(500, new { success = false, message = "An error occurred while retrieving schedules." });
            }
        }

        [HttpPost("BookAppointment")]
        [Authorize(Roles = "Member,Guest")]
        public async Task<IActionResult> BookAppointment([FromBody] BookAppointmentDto dto, [FromHeader(Name = "X-Forwarded-For")] string? clientIp = null)
        {
            try
            {
                if (dto == null || dto.ConsultantId <= 0 || dto.ScheduleIds == null || !dto.ScheduleIds.Any())
                {
                    Log.Warning("Invalid booking request: {Dto}", JsonSerializer.Serialize(dto));
                    return BadRequest(new { success = false, message = "Invalid booking request." });
                }

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

                Log.Information("Booking appointment for UserID={UserID} with ConsultantID={ConsultantId}", userId, dto.ConsultantId);

                // Lấy IP client, ưu tiên X-Forwarded-For và kiểm tra định dạng
                var clientIpAddress = clientIp?.Split(',')[0]; // Lấy IP đầu tiên từ X-Forwarded-For
                if (string.IsNullOrEmpty(clientIpAddress))
                {
                    clientIpAddress = HttpContext.Connection.RemoteIpAddress?.ToString();
                }
                clientIpAddress = clientIpAddress ?? "127.0.0.1"; // Fallback an toàn
                Log.Information("Using client IP from header: {ClientIpAddress}", clientIpAddress);

                var (appointment, paymentUrl) = await _appointmentService.BookAppointmentAsync(dto, userId, clientIpAddress);
                return Ok(new { success = true, data = new { Appointment = appointment, PaymentUrl = paymentUrl } });
            }
            catch (InvalidOperationException ex)
            {
                Log.Warning(ex, "Booking failed for UserID={UserID}: {Message}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value, ex.Message);
                return BadRequest(new { success = false, message = ex.Message });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error booking appointment for UserID={UserID}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
                return StatusCode(500, new { success = false, message = "An error occurred while booking the appointment." });
            }
        }


        [HttpPost("{appointmentId}/confirm-payment")]
        [Authorize(Roles = "Member,Guest")]
        public async Task<IActionResult> ConfirmPayment(int appointmentId, [FromQuery] string transactionId, [FromQuery] string vnpayResponseCode)
        {
            try
            {
                var transactionParts = transactionId.Split(new[] { '-' }, StringSplitOptions.RemoveEmptyEntries);
                var appointmentIdStr = transactionParts.Last();
                if (!int.TryParse(appointmentIdStr, out int extractedAppointmentId) || extractedAppointmentId != appointmentId)
                {
                    return BadRequest(new { success = false, message = "Invalid transaction ID format." });
                }

                var appointment = await _appointmentService.ConfirmPaymentAsync(appointmentId, transactionId, vnpayResponseCode, HttpContext);
                return Ok(new { success = true, data = appointment });
            }
            catch (InvalidOperationException ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "An error occurred while confirming payment." });
            }
        }

        // Thêm endpoint để xử lý callback từ VNPay
        [HttpPost("vnpay/return")]
        [AllowAnonymous]
        public async Task<IActionResult> HandleVnpayReturn()
        {
            try
            {
                var queryParams = HttpContext.Request.HasFormContentType
                    ? HttpContext.Request.Form.ToDictionary(k => k.Key, v => v.Value.ToString())
                    : HttpContext.Request.Query.ToDictionary(k => k.Key, v => v.Value.ToString());

                if (string.IsNullOrEmpty(queryParams.GetValueOrDefault("vnp_TxnRef")) || string.IsNullOrEmpty(queryParams.GetValueOrDefault("vnp_ResponseCode")))
                {
                    Log.Warning("Invalid VNPay return request: TransactionID={TransactionId}, ResponseCode={ResponseCode}",
                        queryParams.GetValueOrDefault("vnp_TxnRef"), queryParams.GetValueOrDefault("vnp_ResponseCode"));
                    return BadRequest(new { success = false, message = "Invalid transaction or response code." });
                }

                var transactionParts = queryParams["vnp_TxnRef"].Split(new[] { '-' }, StringSplitOptions.RemoveEmptyEntries);
                var appointmentIdStr = transactionParts.Last();
                if (!int.TryParse(appointmentIdStr, out int appointmentId))
                {
                    Log.Warning("Invalid transactionId format: {Transa  ctionId}", queryParams["vnp_TxnRef"]);
                    return BadRequest(new { success = false, message = "Invalid transaction ID format." });
                }

                var appointment = await _appointmentService.ConfirmPaymentAsync(appointmentId, queryParams["vnp_TxnRef"], queryParams["vnp_ResponseCode"], HttpContext);
                return Ok(new { success = true, data = appointment });
            }
            catch (InvalidOperationException ex)
            {
                Log.Warning(ex, "VNPay return failed for TransactionID={TransactionId}: {Message}",
                    HttpContext.Request.Query["vnp_TxnRef"], ex.Message);
                return BadRequest(new { success = false, message = ex.Message });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error processing VNPay return for TransactionID={TransactionId}",
                    HttpContext.Request.Query["vnp_TxnRef"]);
                return StatusCode(500, new { success = false, message = "An error occurred while processing VNPay return." });
            }
        }

        [HttpGet("GetAppointmentAboutMember")]
        [Authorize(Roles = "Member,Guest")]
        public async Task<IActionResult> GetMyAppointments()
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

                var appointments = await _appointmentService.GetUserAppointmentsAsync(userId);
                return Ok(new { success = true, data = appointments });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving appointments for UserID={UserID}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
                return StatusCode(500, new { success = false, message = "An error occurred while retrieving appointments." });
            }
        }

        [HttpGet("GetAllAppointmentAboutConsultant")]
        [Authorize(Roles = "Consultant")]
        public async Task<IActionResult> GetConsultantAppointments()
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
                    return new ContentResult
                    {
                        StatusCode = 403,
                        Content = JsonSerializer.Serialize(new { success = false, message = "User is not a consultant." }),
                        ContentType = "application/json"
                    };
                }

                var appointments = await _appointmentService.GetConsultantAppointmentsAsync(consultant.ConsultantID);
                return Ok(new { success = true, data = appointments });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving consultant appointments for UserID={UserID}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
                return StatusCode(500, new { success = false, message = "An error occurred while retrieving consultant appointments." });
            }
        }

        [HttpGet("GetAppointmentConsultant(ID)")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetConsultantAppointmentsById(int consultantId)
        {
            try
            {
                var appointments = await _appointmentService.GetConsultantAppointmentsAsync(consultantId);
                return Ok(new { success = true, data = appointments });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving consultant appointments for ConsultantID={ConsultantId}", consultantId);
                return StatusCode(500, new { success = false, message = "An error occurred while retrieving consultant appointments." });
            }
        }

        [HttpGet("payment-history")]
        [Authorize(Roles = "Admin,Member,Guest")]
        public async Task<IActionResult> GetPaymentHistory([FromQuery] DateTime? startDate, [FromQuery] DateTime? endDate)
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

                var isAdmin = User.IsInRole("Admin");
                var payments = await _appointmentService.GetPaymentHistoryAsync(userId, isAdmin, startDate, endDate);
                return Ok(new { success = true, data = payments });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving payment history for UserID={UserID}", User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
                return StatusCode(500, new { success = false, message = "An error occurred while retrieving payment history." });
            }
        }

    }
}