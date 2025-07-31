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
        private readonly ICourseRegistrationService _courseRegistrationService;


        public VNPayController(
            IAppointmentService appointmentService,
            VNPayHelper vnpayHelper,
            ICourseRegistrationService courseRegistrationService)
        {
            _appointmentService = appointmentService;
            _vnpayHelper = vnpayHelper;
            _courseRegistrationService = courseRegistrationService;
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

            var transactionId = vnpTxnRef;
            var vnpayResponseCode = queryParams.TryGetValue("vnp_ResponseCode", out var code) ? code : "99";

            try
            {
                if (vnpTxnRef.Contains("COURSE-"))
                {
                    var courseRegistrationId = _vnpayHelper.ExtractCourseRegistrationIdFromTxnRef(vnpTxnRef);
                    var result = await _courseRegistrationService.ConfirmPaymentAsync(courseRegistrationId, vnpTxnRef, vnpayResponseCode, HttpContext);

                    string redirectUrl = "http://localhost:5173/UserCourses";
                    if (vnpayResponseCode == "00")
                    {
                        redirectUrl += "?status=success";
                    }
                    else
                    {
                        redirectUrl += $"?status=error&code={vnpayResponseCode}";
                    }
                    return Redirect(redirectUrl);
                }
                else
                {
                    var appointmentId = _vnpayHelper.ExtractAppointmentIdFromTxnRef(vnpTxnRef);
                    var appointment = await _appointmentService.ConfirmPaymentAsync(appointmentId, vnpTxnRef, vnpayResponseCode, HttpContext);

                    string redirectUrl = "http://localhost:5173/UserAppointments";
                    if (vnpayResponseCode == "00")
                    {
                        redirectUrl += "?status=success";
                    }
                    else
                    {
                        redirectUrl += $"?status=error&code={vnpayResponseCode}";
                    }
                    return Redirect(redirectUrl);
                }
            }
            catch (BusinessRuleViolationException ex)
            {
                Serilog.Log.Warning("VNPay return failed: {Message}", ex.Message);
                return BadRequest(new { success = false, message = ex.Message });
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Error processing VNPay return callback");
                return StatusCode(500, new { success = false, message = "An error occurred while processing the payment callback." });
            }
        }
      

    }
}