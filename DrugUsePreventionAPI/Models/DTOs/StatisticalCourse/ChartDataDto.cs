namespace DrugUsePreventionAPI.Models.DTOs.StatisticalCourse
{
    public class ChartDataDto
    {
        public List<TimePointValueDto> EnrollmentOverTime { get; set; }
        public List<TimePointValueDto> CompletionTrend { get; set; }
        public List<PieChartSegmentDto> TargetAudienceRatio { get; set; }
    }
}
