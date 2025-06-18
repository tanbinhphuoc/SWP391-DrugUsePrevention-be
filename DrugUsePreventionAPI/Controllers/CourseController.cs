using DrugUsePreventionAPI.Models.DTOs.Course;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseController : ControllerBase
    {
        private readonly ICourseService _courseService;

        public CourseController(ICourseService courseService)
        {
            _courseService = courseService;
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpPost("CreateCourse")]
        public async Task<IActionResult> CreateCourse([FromBody] CreateCourseDto createCourseDto)
        {
            var result = await _courseService.CreateCourse(createCourseDto);
            if (result)
                return Ok("Tạo Khóa Học Thành Công.");
            return BadRequest("Tạo Khóa Học Thất Bại.");
        }

        [AllowAnonymous]
        [HttpGet("GetAllCourse")]
        public async Task<ActionResult<List<Course>>> GetAllCourses()
        {
            var courses = await _courseService.GetAllCourses();
            return Ok(courses);
        }

        [AllowAnonymous]
        [HttpGet("GetCourseByID")]
        public async Task<ActionResult<Course>> GetCourseById([FromQuery] int id)
        {
            var course = await _courseService.GetCourseById(id);
            if (course == null)
                return NotFound(new { message = "Khóa Học Không Tồn Tại." });
            return Ok(course);
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpPut("UpdateCourse")]
        public async Task<IActionResult> UpdateCourse([FromQuery] int id, [FromBody] CreateCourseDto courseDto)
        {
            var result = await _courseService.UpdateCourse(id, courseDto);
            if (result)
                return Ok(new { message = "Cập Nhật Khóa Học Thành Công" });
            return NotFound(new { message = "Cập Nhật Khóa Học Thất Bại" });
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpDelete("DeleteCourse")]
        public async Task<IActionResult> DeleteCourse([FromQuery] int id)
        {
            var result = await _courseService.DeleteCourse(id);
            if (result)
                return Ok(new { message = "Xóa Khóa Học Thành Công." });
            return NotFound(new { message = "Xóa Khóa Học Thất Bại." });
        }

        [HttpGet("recommend")]
        public async Task<IActionResult> RecommendCourses([FromQuery] double score)
        {
            string courseType = score <= 4 ? "COBAN" : "NANGCAO";

            var courses = await _courseService.GetCoursesByTypeAsync(courseType);

            return Ok(courses);
        }
    }

}