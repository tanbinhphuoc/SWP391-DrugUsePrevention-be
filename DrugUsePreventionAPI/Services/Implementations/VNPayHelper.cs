using DrugUsePreventionAPI.Models.Entities;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class VNPayHelper
    {
        private readonly IConfiguration _configuration;

        public VNPayHelper(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public string CreatePaymentUrl(Payment payment, string orderInfo)
        {
            var vnpayConfig = _configuration.GetSection("VNPay");
            var tmnCode = vnpayConfig["TmnCode"] ?? throw new InvalidOperationException("TmnCode is not configured.");
            var hashSecret = vnpayConfig["HashSecret"] ?? throw new InvalidOperationException("HashSecret is not configured.");
            var vnpUrl = vnpayConfig["BaseUrl"] + "/paymentv2/vpcpay.html";
            var returnUrl = vnpayConfig["ReturnUrl"] ?? throw new InvalidOperationException("ReturnUrl is not configured.");

            var vnpParams = new Dictionary<string, string>
        {
            { "vnp_Version", "2.1.0" },
            { "vnp_Command", "pay" },
            { "vnp_TmnCode", tmnCode },
            { "vnp_Amount", ((int)(payment.Amount * 100)).ToString() },
            { "vnp_CreateDate", DateTime.Now.ToString("yyyyMMddHHmmss") },
            { "vnp_CurrCode", "VND" },
            { "vnp_IpAddr", "127.0.0.1" },
            { "vnp_Locale", "vn" },
            { "vnp_OrderInfo", orderInfo },
            { "vnp_OrderType", "appointment_payment" },
            { "vnp_ReturnUrl", returnUrl },
            { "vnp_TxnRef", payment.TransactionID }
        };

            var sortedParams = vnpParams.OrderBy(kvp => kvp.Key);
            var queryString = string.Join("&", sortedParams.Select(kvp => $"{kvp.Key}={Uri.EscapeDataString(kvp.Value)}"));
            var hashData = $"{hashSecret}&{queryString}";
            var secureHash = ComputeHmacSha256(hashData, hashSecret);
            queryString += $"&vnp_SecureHash={secureHash}";

            return $"{vnpUrl}?{queryString}";
        }

        public bool VerifyCallback(Dictionary<string, string> queryParams)
        {
            var vnpayConfig = _configuration.GetSection("VNPay");
            var hashSecret = vnpayConfig["HashSecret"];

            var secureHash = queryParams["vnp_SecureHash"];
            queryParams.Remove("vnp_SecureHash");

            var sortedParams = queryParams.OrderBy(kvp => kvp.Key);
            var hashData = string.Join("&", sortedParams.Select(kvp => $"{kvp.Key}={kvp.Value}"));
            var computedHash = ComputeHmacSha256(hashData, hashSecret);

            return secureHash.Equals(computedHash, StringComparison.OrdinalIgnoreCase);
        }

        private string ComputeHmacSha256(string data, string key)
        {
            using (var hmac = new HMACSHA256(Encoding.UTF8.GetBytes(key)))
            {
                var hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(data));
                return BitConverter.ToString(hash).Replace("-", "").ToLower();
            }
        }
    }

}