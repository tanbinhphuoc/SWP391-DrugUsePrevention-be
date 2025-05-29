using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class SurveyResponse
    {
        [Key]
        public int ResponseID { get; set; }

        [Required]
        public int UserID { get; set; }

        [Required]
        public int SurveyID { get; set; }

        public int? ProgramID { get; set; }

        public string? ResponseData { get; set; }

        public DateTime SubmitTime { get; set; } = DateTime.Now;

        // Navigation properties
        public virtual User User { get; set; }
        public virtual Survey Survey { get; set; }
        public virtual CommunicationProgram? Program { get; set; }
    }
}