using DrugUsePreventionAPI.Exceptions;
using DrugUsePreventionAPI.Services.Implementations;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/vnpay")]
    [ApiController]
    public class VNPayController : ControllerBase
    {
        private readonly IAppointmentService _appointmentService;
        private readonly VNPayHelper _vnpayHelper;

        public VNPayController(IAppointmentService appointmentService, VNPayHelper vnpayHelper)
        {
            _appointmentService = appointmentService ?? throw new ArgumentNullException(nameof(appointmentService));
            _vnpayHelper = vnpayHelper ?? throw new ArgumentNullException(nameof(vnpayHelper));
        }

        [HttpGet("return")]
        [HttpPost("return")]
        [AllowAnonymous]
        public async Task<IActionResult> ReturnUrl()
        {
            var queryParams = Request.Query.ToDictionary(q => q.Key, q => q.Value.ToString());
            if (Request.HasFormContentType)
            {
                var formData = await Request.ReadFormAsync();
                foreach (var kvp in formData)
                    queryParams[kvp.Key] = kvp.Value.ToString();
            }

            Serilog.Log.Information("VNPay RETURN callback received: {Params}", System.Text.Json.JsonSerializer.Serialize(queryParams));

            if (queryParams.Count == 0)
                return BadRequest(new { success = false, message = "No data received from VNPay." });

            if (!_vnpayHelper.VerifyCallback(queryParams))
                return BadRequest(new { success = false, message = "Invalid signature." });

            if (!queryParams.TryGetValue("vnp_TxnRef", out var vnpTxnRef) || string.IsNullOrEmpty(vnpTxnRef))
                return BadRequest(new { success = false, message = "Transaction reference missing." });

            var appointmentId = _vnpayHelper.ExtractAppointmentIdFromTxnRef(vnpTxnRef);
            var transactionId = vnpTxnRef;
            var vnpayResponseCode = queryParams.TryGetValue("vnp_ResponseCode", out var code) ? code : "99";

            try
            {
                var appointment = await _appointmentService.ConfirmPaymentAsync(appointmentId, transactionId, vnpayResponseCode, HttpContext);

                // Trả về kết quả và chuyển hướng đến trang frontend
                string frontendUrl = $"http://localhost:5173/user-dashboard/appointments?appointmentId={appointmentId}&vnp_ResponseCode={vnpayResponseCode}";

                // Chuyển hướng người dùng đến trang frontend
                return Redirect(frontendUrl);
            }
            catch (BusinessRuleViolationException ex)
            {
                Serilog.Log.Warning("VNPay return failed: {Message}", ex.Message);
                return BadRequest(new { success = false, message = ex.Message });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Error processing VNPay return callback for appointment {AppointmentId}", appointmentId);
                return StatusCode(500, new { success = false, message = "An error occurred while processing the payment callback." });
            }
        }

        [HttpPost("ipn")]
        [AllowAnonymous]
        public async Task<IActionResult> IpnUrl()
        {
            var queryParams = Request.Query.ToDictionary(q => q.Key, q => q.Value.ToString());
            if (Request.HasFormContentType)
            {
                var formData = await Request.ReadFormAsync();
                foreach (var kvp in formData)
                    queryParams[kvp.Key] = kvp.Value.ToString();
            }

            Serilog.Log.Information("VNPay IPN received: {Params}", System.Text.Json.JsonSerializer.Serialize(queryParams));

            if (!_vnpayHelper.VerifyCallback(queryParams))
                return BadRequest(new { RspCode = "97", Message = "Invalid signature." });

            if (!queryParams.TryGetValue("vnp_TxnRef", out var vnpTxnRef) || string.IsNullOrEmpty(vnpTxnRef))
                return BadRequest(new { RspCode = "01", Message = "Transaction reference missing." });

            var appointmentId = _vnpayHelper.ExtractAppointmentIdFromTxnRef(vnpTxnRef);

            try
            {
                await _appointmentService.HandleIPNAsync(queryParams);
                return Ok(new { RspCode = "00", Message = "Confirm success." });
            }
            catch (EntityNotFoundException)
            {
                Serilog.Log.Warning("IPN: Appointment or payment not found for transaction {TransactionId}", vnpTxnRef);
                return BadRequest(new { RspCode = "01", Message = "Order not found." });
            }
            catch (BusinessRuleViolationException ex)
            {
                Serilog.Log.Warning("IPN: {Message}", ex.Message);
                return BadRequest(new { RspCode = "97", Message = ex.Message });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Error processing VNPay IPN callback for appointment {AppointmentId}", appointmentId);
                return StatusCode(500, new { RspCode = "99", Message = "Unknown error." });
            }
        }
    }
}