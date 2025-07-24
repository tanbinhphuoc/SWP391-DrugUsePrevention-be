using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.DTOs.User
{
    public class AdminUpdateConsultantDto
    {
        [StringLength(100, ErrorMessage = "Tên đăng nhập không được vượt quá 100 ký tự.")]
        public string? UserName { get; set; }

        [StringLength(255, MinimumLength = 8, ErrorMessage = "Mật khẩu phải có ít nhất 8 ký tự.")]
        public string? Password { get; set; }

        [EmailAddress(ErrorMessage = "Email không hợp lệ.")]
        public string? Email { get; set; }

        [StringLength(150, ErrorMessage = "Họ tên không được vượt quá 150 ký tự.")]
        public string? FullName { get; set; }

        public string? Degree { get; set; }

        public decimal? HourlyRate { get; set; }

        public string? Specialty { get; set; }

        public string? Experience { get; set; }

        [StringLength(255, ErrorMessage = "Tên chứng chỉ không được vượt quá 255 ký tự.")]
        public string? CertificateName { get; set; }

        [DataType(DataType.Date)]
        public DateTime? DateAcquired { get; set; }

        [Url(ErrorMessage = "Google Meet link must be a valid URL.")]
        public string? GoogleMeetLink { get; set; }
    }
}
