using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.DTOs.Appointment
{
    public class BookAppointmentDto
    {
        [Required]
        public int ConsultantID { get; set; }

        [Required]
        [MinLength(1, ErrorMessage = "At least one time slot must be selected.")]
        public List<int> ScheduleIDs { get; set; }

        public string Note { get; set; }

        [Required]
        public string PaymentMethod { get; set; }
    }
}
