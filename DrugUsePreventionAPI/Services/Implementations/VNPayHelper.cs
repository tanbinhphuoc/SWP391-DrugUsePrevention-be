using DrugUsePreventionAPI.Configurations;
using DrugUsePreventionAPI.Models.Entities;
using Microsoft.Extensions.Options;
using System.Net;
using System.Security.Cryptography;
using System.Text;

public class VNPayHelper
{
    private readonly VNPaySettings _vnpaySettings;
    public int MaxRetryAttempts => 3;

    public VNPayHelper(IOptions<VNPaySettings> vnpaySettings)
    {
        _vnpaySettings = vnpaySettings.Value ?? throw new ArgumentNullException(nameof(vnpaySettings));
    }

    private static string Encode(string input)
        => WebUtility.UrlEncode(input).Replace("+", "%20");

    public string CreatePaymentUrl(Payment payment, string orderInfo, string clientIp, HttpContext context = null, DateTime? expireDate = null)
    {
        var tmnCode = _vnpaySettings.TmnCode;
        var hashSecret = _vnpaySettings.HashSecret;
        var vnpUrl = _vnpaySettings.PaymentUrl;
        var returnUrl = _vnpaySettings.ReturnUrl;

        var ipAddress = clientIp ?? context?.Connection?.RemoteIpAddress?.ToString() ?? "127.0.0.1";
        var vietnamTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, TimeZoneInfo.FindSystemTimeZoneById("SE Asia Standard Time"));
        var vnp_CreateDate = vietnamTime.ToString("yyyyMMddHHmmss");
        var vnp_ExpireDate = (expireDate ?? vietnamTime.AddMinutes(15)).ToString("yyyyMMddHHmmss");

        var vnpParams = new SortedDictionary<string, string>
    {
        { "vnp_Version", "2.1.0" },
        { "vnp_Command", "pay" },
        { "vnp_TmnCode", tmnCode },
        { "vnp_Amount", ((int)(payment.Amount * 100)).ToString() },
        { "vnp_CreateDate", vnp_CreateDate },
        { "vnp_ExpireDate", vnp_ExpireDate },
        { "vnp_CurrCode", "VND" },
        { "vnp_IpAddr", ipAddress },
        { "vnp_Locale", "vn" },
        { "vnp_OrderInfo", orderInfo.Length > 100 ? orderInfo.Substring(0, 100) : orderInfo },
        { "vnp_OrderType", "other" },
        { "vnp_ReturnUrl", returnUrl },
        { "vnp_TxnRef", payment.TransactionID }
    };

        var signData = string.Join("&", vnpParams.Select(kvp => $"{kvp.Key}={WebUtility.UrlEncode(kvp.Value)}"));
        var secureHash = ComputeHmacSha512(hashSecret, signData);

        var queryString = signData + $"&vnp_SecureHash={secureHash}";
        return $"{vnpUrl}?{queryString}";
    }

    public bool VerifyCallback(Dictionary<string, string> queryParams)
    {
        var hashSecret = _vnpaySettings.HashSecret;
        if (!queryParams.TryGetValue("vnp_SecureHash", out var secureHash) || string.IsNullOrEmpty(secureHash))
        {
            Serilog.Log.Warning("Missing or empty vnp_SecureHash in callback");
            return false;
        }

        var vnpParams = queryParams
            .Where(kvp => kvp.Key != "vnp_SecureHash" && kvp.Key != "vnp_SecureHashType")
            .ToDictionary(kvp => kvp.Key, kvp => kvp.Value);

        if (vnpParams.Count == 0)
        {
            Serilog.Log.Warning("No valid parameters for signature verification");
            return false;
        }

        var sortedParams = vnpParams.OrderBy(kvp => kvp.Key).ToList();
        var signData = string.Join("&", sortedParams.Select(kvp => $"{kvp.Key}={WebUtility.UrlEncode(kvp.Value)}"));
        var computedHash = ComputeHmacSha512(hashSecret, signData);

        if (!secureHash.Equals(computedHash, StringComparison.OrdinalIgnoreCase))
        {
            Serilog.Log.Warning("Signature mismatch. Expected: {ComputedHash}, Received: {SecureHash}", computedHash, secureHash);
            return false;
        }

        Serilog.Log.Information("Callback signature verified successfully for transaction {TransactionId}", queryParams.GetValueOrDefault("vnp_TxnRef"));
        return true;
    }

    public int ExtractAppointmentIdFromTxnRef(string txnRef)
    {
        var parts = txnRef.Split('-', StringSplitOptions.RemoveEmptyEntries);
        var appointmentIdStr = parts.Last();
        if (!int.TryParse(appointmentIdStr, out int appointmentId))
        {
            Serilog.Log.Error("Invalid transaction reference format: {TxnRef}", txnRef);
            throw new ArgumentException("Invalid transaction reference format.");
        }
        return appointmentId;
    }
    public int ExtractCourseRegistrationIdFromTxnRef(string txnRef)
    {
        if (!txnRef.StartsWith("COURSE-"))
            throw new ArgumentException("Invalid transaction reference format.");

        var withoutPrefix = txnRef.Substring("COURSE-".Length);
        var parts = withoutPrefix.Split('-', 2); 

        if (parts.Length < 2 || !int.TryParse(parts[0], out int registrationId))
            throw new ArgumentException("Invalid CourseRegistrationID in transaction reference.");

        return registrationId;
    }


    private string ComputeHmacSha512(string key, string inputData)
    {
        var keyBytes = Encoding.UTF8.GetBytes(key);
        var inputBytes = Encoding.UTF8.GetBytes(inputData);
        using (var hmac = new HMACSHA512(keyBytes))
        {
            var hashValue = hmac.ComputeHash(inputBytes);
            return BitConverter.ToString(hashValue).Replace("-", "").ToLower();
        }
    }
}