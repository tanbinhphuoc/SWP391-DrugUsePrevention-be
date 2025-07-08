using DrugUsePreventionAPI.Models.DTOs.CourseVideo;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseVideoController : ControllerBase
    {
        private readonly ICourseVideoService _courseVideoService;

        public CourseVideoController(ICourseVideoService courseVideoService)
        {
            _courseVideoService = courseVideoService;
        }

        [HttpGet("ByCourse/{courseId}")]
        public async Task<IActionResult> GetVideosByCourseId(int courseId)
        {
            try
            {
                var videos = await _courseVideoService.GetVideosByCourseIdAsync(courseId);

                return Ok(new
                {
                    success = true,
                    message = $"Lấy danh sách video khóa học {courseId} thành công",
                    data = videos
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new
                {
                    success = false,
                    message = $"Lỗi khi lấy video: {ex.Message}"
                });
            }
        }
        [HttpPost("add")]
        public async Task<IActionResult> AddVideo([FromBody] CreateCourseVideoDto dto)
        {
            await _courseVideoService.AddCourseVideoAsync(dto);
            return Ok(new { success = true, message = "Thêm video thành công" });
        }

        // Đánh dấu đã xem hoặc chưa xem
        [HttpPost("set-progress")]
        public async Task<IActionResult> SetVideoProgress([FromBody] UserVideoProgressDto dto)
        {
            await _courseVideoService.SetUserVideoProgressAsync(dto);
            return Ok(new { success = true, message = "Cập nhật tiến độ xem video" });
        }

        // Kiểm tra user đã xem hết chưa
        [HttpGet("completed")]
        public async Task<IActionResult> HasCompleted([FromQuery] int userId, [FromQuery] int courseId)
        {
            bool completed = await _courseVideoService.HasUserCompletedCourse(userId, courseId);
            return Ok(new { success = true, completed });
        }

        // Lấy danh sách video trong khóa học
        [HttpGet("{courseId}")]
        public async Task<IActionResult> GetVideos(int courseId)
        {
            var videos = await _courseVideoService.GetVideosByCourseIdAsync(courseId);
            return Ok(new { success = true, videos });
        }
    }
}
