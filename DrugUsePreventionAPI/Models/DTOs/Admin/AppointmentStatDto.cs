namespace DrugUsePreventionAPI.Models.DTOs.Admin
{
    public class AppointmentStatDto
    {
        public int TotalAppointments { get; set; }
        public int TotalConfirmedAppointments { get; set; }
        public int TotalCancelledAppointments { get; set; }
        public int TotalPendingAppointments { get; set; }
    }
}