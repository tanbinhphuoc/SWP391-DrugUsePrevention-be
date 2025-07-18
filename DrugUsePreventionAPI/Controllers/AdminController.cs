using DrugUsePreventionAPI.Exceptions;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Serilog;
using System;
using System.Net;
using System.Net.Mail;
using System.Security.Claims;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class AdminController : ControllerBase
    {
        private readonly IUserService _userService;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IAppointmentService _appointmentService;
        private readonly IConsultantService _consultantService;
        private readonly IConfiguration _configuration;

        public AdminController(
            IUserService userService,
            IUnitOfWork unitOfWork,
            IAppointmentService appointmentService,
            IConsultantService consultantService,
            IConfiguration configuration)
        {
            _userService = userService;
            _unitOfWork = unitOfWork;
            _appointmentService = appointmentService;
            _consultantService = consultantService;
            _configuration = configuration;
        }

        [HttpGet("users/{id}FindUserByID")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetUser(int id)
        {
            var user = await _userService.GetUserByIdAsync(id);
            if (user == null)
                return NotFound();
            return Ok(user);
        }

        [HttpGet("GetAllUsers")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetAllUsers()
        {
            Log.Information("User: {User}, IsAuthenticated: {IsAuth}, Roles: {Roles}",
                User.Identity?.Name, User.Identity?.IsAuthenticated, User.FindAll(ClaimTypes.Role));
            var users = await _userService.GetAllUsersAsync();
            return Ok(new { success = true, data = users });
        }

        [HttpGet("GetAllMember")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetMemberUsers()
        {
            Log.Information("User: {User}, IsAuthenticated: {IsAuth}, Roles: {Roles}",
                User.Identity?.Name, User.Identity?.IsAuthenticated, User.FindAll(ClaimTypes.Role));
            var users = await _userService.GetAllMemberAsync();
            return Ok(new { success = true, data = users });
        }

        [HttpGet("users/role/{roleName}GetUserByRole")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetUsersByRole(string roleName)
        {
            var users = await _userService.GetUsersByRoleAsync(roleName);
            return Ok(new { success = true, data = users });
        }

        [HttpGet("users/status/{status}GetUserByStatus")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetUsersByStatus(string status)
        {
            var users = await _userService.GetUsersByStatusAsync(status);
            return Ok(new { success = true, data = users });
        }

        [HttpGet("users/GetUsersByCreatedDateRange")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetUsersByCreatedDateRange([FromQuery] DateTime startDate, [FromQuery] DateTime endDate)
        {
            var users = await _userService.GetUsersByCreatedDateRangeAsync(startDate, endDate);
            return Ok(new { success = true, data = users });
        }

        [HttpGet("users/SearchUsers(Name or Email)")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> SearchUsers([FromQuery] string searchTerm)
        {
            var users = await _userService.SearchUsersAsync(searchTerm);
            return Ok(new { success = true, data = users });
        }

        [HttpGet("users/GetUserCountByRole")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetUserCountByRole(string roleName)
        {
            var count = await _userService.GetUserCountByRoleAsync(roleName);
            return Ok(new { success = true, data = count });
        }

        [HttpGet("users/stats/GetNewUserCount")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetNewUserCount([FromQuery] DateTime startDate)
        {
            var count = await _userService.GetNewUserCountAsync(startDate);
            return Ok(new { success = true, data = count });
        }

        [HttpGet("users/stats/Ratio(Active/Inactive)")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetActiveInactiveRatio()
        {
            var ratio = await _userService.GetActiveInactiveRatioAsync();
            return Ok(new { success = true, data = ratio });
        }

        [HttpPut("users/{id}/SetStatusForUser")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> ToggleUserStatus(int id, [FromBody] string newStatus)
        {
            try
            {
                await _userService.ToggleUserStatusAsync(id, newStatus);
                return Ok(new { success = true, message = $"User status updated to {newStatus}." });
            }
            catch (EntityNotFoundException ex)
            {
                Log.Warning(ex, "User {UserId} not found", id);
                return NotFound(new { success = false, message = ex.Message });
            }
            catch (BusinessRuleViolationException ex)
            {
                Log.Warning(ex, "Invalid status update for User {UserId}: {Message}", id, ex.Message);
                return BadRequest(new { success = false, message = ex.Message });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error toggling status for User {UserId}", id);
                return StatusCode(500, new { success = false, message = "An error occurred while updating user status." });
            }
        }

        [HttpGet("GetAllAppointments")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetAllAppointments()
        {
            try
            {
                var appointments = await _appointmentService.GetAllAppointmentsAsync();
                return Ok(new { success = true, data = appointments });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error retrieving all appointments");
                return StatusCode(500, new { success = false, message = "An error occurred while retrieving appointments." });
            }
        }

        [HttpGet("GetAllConsultants")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetAllConsultants()
        {
            var consultants = await _consultantService.GetConsultantsByStatusAsync("Active");
            return Ok(new { success = true, data = consultants });
        }

        [HttpGet("consultants/GetConsultantsBySpecialty")]
        public async Task<IActionResult> GetConsultantsBySpecialty(string specialty)
        {
            var consultants = await _consultantService.GetConsultantsBySpecialtyAsync(specialty);
            return Ok(new { success = true, data = consultants });
        }

        [HttpGet("consultants/GetConsultantsByStatus")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetConsultantsByStatus(string status)
        {
            var consultants = await _consultantService.GetConsultantsByStatusAsync(status);
            return Ok(new { success = true, data = consultants });
        }

        [HttpGet("consultants/GetConsultantPerformanceStats")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetConsultantPerformanceStats(int consultantId)
        {
            var stats = await _consultantService.GetConsultantPerformanceStatsAsync(consultantId);
            return Ok(new { success = true, data = stats });
        }

        [HttpGet("payment-statistics")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetPaymentStatistics([FromQuery] DateTime? startDate, [FromQuery] DateTime? endDate)
        {
            try
            {
                var stats = await _appointmentService.GetPaymentStatisticsAsync(startDate, endDate);
                return Ok(new
                {
                    success = true,
                    data = stats
                });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Error retrieving payment statistics");
                return StatusCode(500, new { success = false, message = "An error occurred while retrieving payment statistics." });
            }
        }

        [HttpGet("appointment-statistics")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetAppointmentStatistics([FromQuery] DateTime? startDate, [FromQuery] DateTime? endDate)
        {
            try
            {
                var stats = await _appointmentService.GetAppointmentStatisticsAsync(startDate, endDate);
                return Ok(new
                {
                    success = true,
                    data = stats
                });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Error retrieving appointment statistics");
                return StatusCode(500, new { success = false, message = "An error occurred while retrieving appointment statistics." });
            }
        }

        [HttpGet("payment-details/{appointmentId}")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetPaymentDetails(int appointmentId)
        {
            try
            {
                var payment = await _unitOfWork.Payments.GetPaymentByAppointmentIdAsync(appointmentId);
                if (payment == null)
                    return NotFound(new { message = "Payment not found for the specified appointment." });

                return Ok(new
                {
                    PaymentID = payment.PaymentID,
                    AppointmentID = payment.AppointmentID,
                    UserName = payment.Appointment.User.FullName,
                    ConsultantName = payment.Appointment.Consultant.User.FullName,
                    Amount = payment.Amount,
                    PaymentDate = payment.PaymentDate,
                    PaymentMethod = payment.PaymentMethod,
                    Status = payment.Status,
                    TransactionID = payment.TransactionID,
                    AppointmentDetails = new
                    {
                        StartDateTime = payment.Appointment.StartDateTime,
                        EndDateTime = payment.Appointment.EndDateTime,
                        Note = payment.Appointment.Note
                    }
                });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Error retrieving payment details for AppointmentID={AppointmentID}", appointmentId);
                return StatusCode(500, new { message = "An error occurred while retrieving payment details." });
            }
        }

        [HttpPost("payment/{paymentId}/refund")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> RefundPayment(int paymentId)
        {
            try
            {
                var payment = await _unitOfWork.Payments.GetPaymentWithAppointmentDetailsAsync(paymentId);
                if (payment == null || payment.Status != "SUCCESS")
                    return BadRequest(new { message = "Payment is not eligible for refund." });

                payment.Status = "REFUNDED";
                payment.Appointment.Status = "CANCELED";

                _unitOfWork.Payments.Update(payment);
                await _unitOfWork.SaveChangesAsync();

                await SendRefundEmail(payment);

                return Ok(new { message = "Payment refunded successfully." });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Error processing refund for PaymentID={PaymentID}", paymentId);
                return StatusCode(500, new { message = "An error occurred while processing the refund." });
            }
        }

        [HttpPut("appointments/{appointmentId}/UpdateAppointmentStatus")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> UpdateAppointmentStatus(int appointmentId, [FromBody] string newStatus)
        {
            try
            {
                await _appointmentService.UpdateAppointmentStatusAsync(appointmentId, newStatus);
                return Ok(new { success = true, message = "Appointment status updated successfully." });
            }
            catch (EntityNotFoundException ex)
            {
                Log.Warning(ex, "Appointment {AppointmentId} not found", appointmentId);
                return NotFound(new { success = false, message = ex.Message });
            }
            catch (BusinessRuleViolationException ex)
            {
                Log.Warning(ex, "Invalid status update for AppointmentID={AppointmentId}: {Message}", appointmentId, ex.Message);
                return BadRequest(new { success = false, message = ex.Message });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error updating appointment status for AppointmentID={AppointmentId}", appointmentId);
                return StatusCode(500, new { success = false, message = "An error occurred while updating appointment status." });
            }
        }

        [HttpGet("users/GetAllUserStats")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetAllUserStats()
        {
            var roles = await _unitOfWork.Roles.GetAllAsync();
            var stats = new Dictionary<string, object>
    {
        { "roleCounts", new List<int>() },
        { "newUserCount", 0 },
        { "activeInactiveRatio", new Dictionary<string, int>() }
    };

            var roleCounts = new List<int>();
            foreach (var role in roles)
            {
                var count = await _userService.GetUserCountByRoleAsync(role.RoleName);
                roleCounts.Add(count);
            }
            stats["roleCounts"] = roleCounts;

            stats["newUserCount"] = await _userService.GetNewUserCountAsync(DateTime.UtcNow.AddMonths(-1));
            stats["activeInactiveRatio"] = await _userService.GetActiveInactiveRatioAsync();

            return Ok(new { success = true, data = stats });
        }

        [HttpPut("consultants/{consultantId}/toggle-status")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> ToggleConsultantStatus(int consultantId, [FromBody] string newStatus)
        {
            try
            {
                var consultant = await _unitOfWork.Consultants.GetByIdAsync(consultantId);
                if (consultant == null || consultant.User == null)
                {
                    return NotFound(new { success = false, message = "Consultant not found." });
                }
                await _userService.ToggleUserStatusAsync(consultant.UserID, newStatus);
                return Ok(new { success = true, message = $"Consultant status updated to {newStatus}." });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error toggling status for Consultant {ConsultantId}", consultantId);
                return StatusCode(500, new { success = false, message = "An error occurred while updating consultant status." });
            }
        }

        [HttpGet("consultants/GetAllConsultantsPerformanceStats")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetAllConsultantsPerformanceStats()
        {
            var consultants = await _unitOfWork.Consultants.GetAllAsync();
            var stats = new List<object>();

            foreach (var consultant in consultants)
            {
                var performance = await _consultantService.GetConsultantPerformanceStatsAsync(consultant.ConsultantID);
                stats.Add(new { ConsultantId = consultant.ConsultantID, Performance = performance });
            }

            return Ok(new { success = true, data = stats });
        }

        private async Task SendRefundEmail(Payment payment)
        {
            try
            {
                var gmailConfig = _configuration.GetSection("Gmail");
                var email = gmailConfig["Email"];
                var password = gmailConfig["Password"];
                var host = gmailConfig["Host"];
                var port = int.Parse(gmailConfig["Port"]);
                var enableSsl = bool.Parse(gmailConfig["EnableSsl"]);

                var userEmail = payment.Appointment.User.Email;
                var subject = "Refund Confirmation - Drug Prevention System";
                var body = $@"Your payment for appointment ID {payment.AppointmentID} has been refunded.
      Details:
      - Amount: {payment.Amount} VND
      - Transaction ID: {payment.TransactionID}
      - Refund Date: {DateTime.UtcNow:yyyy-MM-dd HH:mm}
      Please contact support for any questions.";

                using (var client = new SmtpClient(host, port))
                {
                    client.Credentials = new NetworkCredential(email, password);
                    client.EnableSsl = enableSsl;

                    var mailMessage = new MailMessage
                    {
                        From = new MailAddress(email, "Drug Prevention System"),
                        Subject = subject,
                        Body = body,
                        IsBodyHtml = false
                    };
                    mailMessage.To.Add(userEmail);

                    await client.SendMailAsync(mailMessage);
                    Serilog.Log.Information("Refund email sent to {UserEmail}", userEmail);
                }
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Error sending refund email for PaymentID={PaymentID}", payment.PaymentID);
                throw new InvalidOperationException("Failed to send refund email.", ex);
            }
        }
    }
}