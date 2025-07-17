namespace DrugUsePreventionAPI.Models.DTOs.CourseRegistration
{
    public class CourseRegistrationDto
    {
        public int CourseRegistrationID { get; set; }
        public int CourseID { get; set; }
        public string CourseName { get; set; }
        public DateTime RegistrationDate { get; set; }
        public string Status { get; set; }
        public decimal? Amount { get; set; }
        public string PaymentStatus { get; set; }
    }
}
