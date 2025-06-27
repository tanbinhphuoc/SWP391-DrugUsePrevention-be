namespace DrugUsePreventionAPI.Models.DTOs.Course
{
    public class CreateCourseDto
    {
        public string? CourseName { get; set; }
        public string? Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string? Status { get; set; }
        public string? Type { get; set;  }
        public int AgeMin { get; set; }
        public int AgeMax { get; set; }
        public int Capacity { get; set; }
        public decimal Price { get; set; }
    }
}
