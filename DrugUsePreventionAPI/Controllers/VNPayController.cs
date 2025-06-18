using DrugUsePreventionAPI.Services.Implementations;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Serilog;
using System.Collections.Generic;
using System.Linq;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VNPayController : ControllerBase
    {
        private readonly IAppointmentService _appointmentService; 
        private readonly VNPayHelper _vnpayHelper;

        public VNPayController(IAppointmentService appointmentService, VNPayHelper vnpayHelper)
        {
            _appointmentService = appointmentService;
            _vnpayHelper = vnpayHelper;
        }

        [HttpGet("return")]
        [AllowAnonymous]
        public async Task<IActionResult> ReturnUrl()
        {
            try
            {
                var queryParams = Request.Query.ToDictionary(q => q.Key, q => q.Value.ToString());
                if (!_vnpayHelper.VerifyCallback(queryParams))
                {
                    Log.Error("Invalid VNPay callback signature");
                    return BadRequest(new { message = "Invalid signature." });
                }

                var vnpTxnRef = queryParams["vnp_TxnRef"];
                var parts = vnpTxnRef.Split('-');
                if (parts.Length < 2)
                {
                    return BadRequest(new { message = "Invalid transaction reference format." });
                }
                var appointmentId = int.Parse(parts[0]);
                var transactionId = vnpTxnRef;
                var vnpayResponseCode = queryParams["vnp_ResponseCode"];

                var appointment = await _appointmentService.ConfirmPaymentAsync(appointmentId, transactionId, vnpayResponseCode);
                return Ok(new { message = "Payment processed successfully.", appointment });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error processing VNPay return callback");
                return StatusCode(500, new { message = "An error occurred while processing the payment callback." });
            }
        }

        [HttpPost("ipn")]
        [AllowAnonymous]
        public async Task<IActionResult> IpnUrl()
        {
            try
            {
                var queryParams = Request.Form.ToDictionary(q => q.Key, q => q.Value.ToString());
                if (!_vnpayHelper.VerifyCallback(queryParams))
                {
                    Log.Error("Invalid VNPay IPN signature");
                    return BadRequest(new { RspCode = "97", Message = "Invalid signature." });
                }

                var appointmentId = int.Parse(queryParams["vnp_TxnRef"].Split('-')[0]);
                var transactionId = queryParams["vnp_TxnRef"];
                var vnpayResponseCode = queryParams["vnp_ResponseCode"];

                await _appointmentService.ConfirmPaymentAsync(appointmentId, transactionId, vnpayResponseCode);
                return Ok(new { RspCode = "00", Message = "Confirm success." });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error processing VNPay IPN callback");
                return StatusCode(500, new { RspCode = "99", Message = "Unknown error." });
            }
        }
    }

}