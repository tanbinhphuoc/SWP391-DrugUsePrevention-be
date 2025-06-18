using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.DTOs.Appointment
{
    public class ConfirmPaymentDto
    {
        [Required]
        public string? TransactionID { get; set; }

        public string? VNPayResponseCode { get; set; }
    }
}

