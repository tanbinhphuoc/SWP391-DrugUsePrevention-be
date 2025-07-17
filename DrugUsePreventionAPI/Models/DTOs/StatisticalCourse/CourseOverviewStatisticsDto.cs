namespace DrugUsePreventionAPI.Models.DTOs.StatisticalCourse
{
    //Thống kê tổng quan khóa học
    public class CourseOverviewStatisticsDto
    {
        public int TotalCourses { get; set; }
        public int OpenCourses { get; set; }
        public int ClosedCourses { get; set; }
        public int PendingCourses { get; set; }
        public int HighSchoolTargetCount { get; set; }
        public int CollegeTargetCount { get; set; }
        public int ParentTargetCount { get; set; }
        public List<string> CoursesWithNoEnrollment { get; set; }
    }

}
