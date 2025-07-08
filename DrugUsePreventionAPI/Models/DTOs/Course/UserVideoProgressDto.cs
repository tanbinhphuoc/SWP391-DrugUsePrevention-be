namespace DrugUsePreventionAPI.Models.DTOs.CourseVideo
{
    public class UserVideoProgressDto
    {
        public int UserID { get; set; }
        public int VideoID { get; set; }
        public bool IsWatched { get; set; }
    }
}