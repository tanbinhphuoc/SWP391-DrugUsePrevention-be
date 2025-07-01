namespace DrugUsePreventionAPI.Models.DTOs.Admin
{
    public class PaymentStatDto
    {
        public int TotalPayments { get; set; }
        public int TotalSuccessfulPayments { get; set; }
        public decimal TotalAmountPaid { get; set; }
        public int TotalPendingPayments { get; set; } // Thêm trường mới
    }
}