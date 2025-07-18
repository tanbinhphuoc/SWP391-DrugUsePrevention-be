namespace DrugUsePreventionAPI.Models.DTOs.StatisticalCourse
{
    public class CourseRevenueStatisticsDto
    {
        public decimal TotalRevenue { get; set; }
        public int TotalTransactions { get; set; }
        public int SuccessfulPayments { get; set; }
        public int FailedPayments { get; set; }
        public int PendingPayments { get; set; }
    }
}
