namespace DrugUsePreventionAPI.Models.Entities
{
    public class ProgramParticipation
    {
        public int UserID { get; set; }
        public int ProgramID { get; set; }
        public DateTime JoinTime { get; set; } = DateTime.Now;

        // Navigation properties
        public virtual User User { get; set; }
        public virtual CommunicationProgram Program { get; set; }
    }
}