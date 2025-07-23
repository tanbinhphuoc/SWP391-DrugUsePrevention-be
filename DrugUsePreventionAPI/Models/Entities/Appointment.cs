namespace DrugUsePreventionAPI.Models.Entities
{
    public class Appointment
    {
        public int AppointmentID { get; set; }
        public int UserID { get; set; }
        public int ConsultantID { get; set; }
        public DateTime StartDateTime { get; set; }
        public DateTime EndDateTime { get; set; }
        public decimal Price { get; set; }
        public string? Status { get; set; }
        public string? Note { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public string? ScheduleIds { get; set; } // New field to store scheduleIDs
        public string? CanceledByRole { get; set; }
        public User? User { get; set; }
        public Consultant? Consultant { get; set; }
        public ICollection<Payment>? Payments { get; set; }
    }
}


