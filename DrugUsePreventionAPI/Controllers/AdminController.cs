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
using System.Threading.Tasks;

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
        private readonly IUnitOfWork _unitOfWork; 
        private readonly IConfiguration _configuration;

        public AdminController(IUserService userService, IConsultantService consultantService, IAuthService authService, IUnitOfWork unitOfWork, IConfiguration configuration)
        {
            _userService = userService;
            _consultantService = consultantService;
            _authService = authService;
            _unitOfWork = unitOfWork;
            _configuration = configuration;
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
                Serilog.Log.Error(ex, "Failed to create consultant: {Message}", ex.Message);
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Unexpected error occurred while creating the consultant: {Message}", ex.Message);
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
                Serilog.Log.Error(ex, "Failed to update consultant: {Message}", ex.Message);
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Unexpected error occurred while updating the consultant: {Message}", ex.Message);
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
                Serilog.Log.Error(ex, "Failed to delete consultant: {Message}", ex.Message);
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Unexpected error occurred while deleting the consultant: {Message}", ex.Message);
                return StatusCode(500, new { message = "An unexpected error occurred while deleting the consultant." });
            }
        }

        [HttpGet("payment-statistics")]
        public async Task<IActionResult> GetPaymentStatistics([FromQuery] DateTime? startDate, [FromQuery] DateTime? endDate, [FromQuery] string? status = null)
        {
            try
            {
                var payments = await _unitOfWork.Payments.GetPaymentsByDateAndStatusAsync(startDate, endDate, status);

                var stats = payments
                    .GroupBy(p => p.Status)
                    .Select(g => new
                    {
                        Status = g.Key,
                        Count = g.Count(),
                        TotalAmount = g.Sum(p => p.Amount)
                    })
                    .ToList();

                var totalRevenue = payments.Sum(p => p.Amount);
                var totalTransactions = payments.Count();

                return Ok(new
                {
                    TotalRevenue = totalRevenue,
                    TotalTransactions = totalTransactions,
                    BreakdownByStatus = stats
                });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Error retrieving payment statistics");
                return StatusCode(500, new { message = "An error occurred while retrieving payment statistics." });
            }
        }

        [HttpGet("payment-details/{appointmentId}")]
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
                        GoogleMeetLink = payment.Appointment.GoogleMeetLink,
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