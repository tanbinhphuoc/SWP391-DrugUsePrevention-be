    using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class Certificate
    {
        [Key]
        public int CertificateID { get; set; }

        [Required]
        [MaxLength(255)]
        public string CertificateName { get; set; }

        public DateTime? DateAcquired { get; set; }

        // Navigation properties
        public virtual ICollection<Consultant> Consultants { get; set; }
    }
}