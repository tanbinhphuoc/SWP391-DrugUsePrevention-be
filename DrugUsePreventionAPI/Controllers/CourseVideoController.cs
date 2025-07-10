using DrugUsePreventionAPI.Models.DTOs.Course;
using DrugUsePreventionAPI.Services.Interfaces;
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
        public async Task<IActionResult> Add([FromBody] CreateCourseVideoDto dto)
        {
            await _service.AddCourseVideoAsync(dto);
            return Ok(new { message = "Thêm video thành công!" });
        }

        [HttpGet("by-course/{courseId}")]
        public async Task<ActionResult<List<CourseVideoDto>>> GetByCourseId(int courseId)
        {
            var result = await _service.GetVideosByCourseIdAsync(courseId);
            return Ok(result);
        }
    }

}
