using DrugUsePreventionAPI.Configurations;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.Extensions.Options;
using Serilog;
using System.Net;
using System.Net.Mail;

public class EmailService : IEmailService
{
    private readonly GmailSettings _gmailSettings;

    public EmailService(IOptions<GmailSettings> gmailSettings)
    {
        _gmailSettings = gmailSettings.Value;
    }

    public async Task SendEmailAsync(string to, string subject, string body, bool isHtml = false)
    {
        try
        {
            using var smtpClient = new SmtpClient(_gmailSettings.Host, _gmailSettings.Port)
            {
                Credentials = new NetworkCredential(_gmailSettings.Email, _gmailSettings.Password),
                EnableSsl = _gmailSettings.EnableSsl
            };
            var mail = new MailMessage(_gmailSettings.Email, to, subject, body) { IsBodyHtml = isHtml };
            await smtpClient.SendMailAsync(mail);  // Send asynchronously
            Log.Information("Email sent to {To}", to);
        }
        catch (Exception ex)
        {
            Log.Error(ex, "Failed to send email to {To}", to);
        }
    }
}
