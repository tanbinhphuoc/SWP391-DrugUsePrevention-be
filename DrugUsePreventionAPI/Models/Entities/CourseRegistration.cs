using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class CourseRegistration
    {
        public int UserID { get; set; }
        public int CourseID { get; set; }
        public DateTime RegisterTime { get; set; } = DateTime.Now;

        // Navigation properties
        public virtual User User { get; set; }
        public virtual Course Course { get; set; }
    }
}