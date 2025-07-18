using DrugUsePreventionAPI.Models.DTOs.Course;
using DrugUsePreventionAPI.Services.Implementations;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseVideoController : ControllerBase
    {
        private readonly ICourseVideoService _service;

        public CourseVideoController(ICourseVideoService service)
        {
            _service = service;
        }

        [HttpPost]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> CreateCourseVideo([FromBody] CreateCourseVideoDto dto)
        {
            var createdVideo = await _service.CreateCourseVideoAsync(dto);

            if (createdVideo == null)
            {
                return BadRequest(new
                {
                    success = false,
                    message = "Thêm video thất bại."
                });
            }

            return Ok(new
            {
                success = true,
                message = "Thêm video thành công!",
                data = new
                {
                    videoID = createdVideo.VideoID
                }
            });
        }

        [HttpPut("Update")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> UpdateVideo([FromBody] UpdateCourseVideoDto dto)
        {
            await _service.UpdateCourseVideoAsync(dto);
            return Ok(new
            {
                success = true,
                message = "Cập nhật video thành công."
            });
        }

        [HttpGet("GetByCourse/{courseId}")]
        public async Task<IActionResult> GetVideosByCourse(int courseId)
        {
            var videos = await _service.GetVideosByCourseIdAsync(courseId);
            return Ok(new
            {
                success = true,
                message = "Lấy danh sách video thành công.",
                data = videos
            });
        }

        [HttpGet("GetByVideo{videoId}")]
        public async Task<IActionResult> GetVideoById(int videoId)
        {
            var video = await _service.GetVideoByIdAsync(videoId);
            return Ok(new
            {
                success = true,
                message = "Lấy video thành công.",
                data = video
            });
        }


        [HttpDelete("Delete/{id}")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> DeleteVideo(int id)
        {
            var success = await _service.DeleteCourseVideoAsync(id);
            if (!success)
                return NotFound(new { message = "Video không tồn tại hoặc đã bị xóa." });

            return Ok(new { message = "Xóa video thành công." });
        }



    }

}
