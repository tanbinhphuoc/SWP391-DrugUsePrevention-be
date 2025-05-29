using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class CommunicationProgram
    {
        [Key]
        public int ProgramID { get; set; }

        [Required]
        [MaxLength(255)]
        public string Name { get; set; }

        public string? Description { get; set; }

        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }

        [MaxLength(255)]
        public string? Location { get; set; }

        // Navigation properties
        public virtual ICollection<ProgramParticipation> ProgramParticipations { get; set; }
        public virtual ICollection<SurveyResponse> SurveyResponses { get; set; }
    }
}