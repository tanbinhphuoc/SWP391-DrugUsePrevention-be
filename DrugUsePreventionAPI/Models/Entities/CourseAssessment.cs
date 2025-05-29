namespace DrugUsePreventionAPI.Models.Entities
{
    public class CourseAssessment
    {
        public int CourseID { get; set; }
        public int AssessmentID { get; set; }

        // Navigation properties
        public virtual Course Course { get; set; }
        public virtual Assessment Assessment { get; set; }
    }
}