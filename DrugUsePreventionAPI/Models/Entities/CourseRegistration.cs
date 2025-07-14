using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using DrugUsePreventionAPI.Models.Entities;

public class CourseRegistration
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int CourseRegistrationID { get; set; }
    public int CourseID { get; set; }
    public int UserID { get; set; }
    public DateTime RegistrationDate { get; set; }
    public string Status { get; set; } // PENDING_PAYMENT, CONFIRMED, CANCELED

    public string? TransactionID { get; set; }
    public decimal? Amount { get; set; }
    public string PaymentStatus { get; set; } // PENDING, SUCCESS, FAILED

    public Course Course { get; set; }
    public User User { get; set; }
}
