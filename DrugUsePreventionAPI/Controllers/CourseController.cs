using DrugUsePreventionAPI.Exceptions;
using DrugUsePreventionAPI.Models.DTOs.Course;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

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
        var courseId = await _courseService.CreateCourse(createCourseDto);
        if (courseId.HasValue)
            return Ok(new
            {
                success = true,
                message = "Tạo Khóa Học Thành Công.",
                data = new { courseId = courseId.Value }
            });

        return BadRequest(new
        {
            success = false,
            message = "Tạo Khóa Học Thất Bại.",
            data = (object)null
        });
    }

    [AllowAnonymous]
    [HttpGet("GetAllCourse")]
    public async Task<IActionResult> GetAllCourses()
    {
        var courses = await _courseService.GetAllCourses();
        return Ok(new
        {
            success = true,
            message = "Lấy danh sách khóa học thành công.",
            data = courses
        });
    }

    [AllowAnonymous]
    [HttpGet("GetCourseByID")]
    public async Task<IActionResult> GetCourseById([FromQuery] int id)
    {
        try
        {
            var course = await _courseService.GetCourseById(id);
            return Ok(new
            {
                success = true,
                message = "Lấy khóa học thành công.",
                data = course
            });
        }
        catch (EntityNotFoundException ex)
        {
            return NotFound(new
            {
                success = false,
                message = ex.Message,
                data = (object)null
            });
        }
    }

    [Authorize(Roles = "Admin,Manager")]
    [HttpPut("UpdateCourse")]
    public async Task<IActionResult> UpdateCourse([FromQuery] int id, [FromBody] CreateCourseDto courseDto)
    {
        try
        {
            var result = await _courseService.UpdateCourse(id, courseDto);
            if (result)
                return Ok(new
                {
                    success = true,
                    message = "Cập nhật Khóa Học thành công.",
                    data = (object)null
                });

            return NotFound(new
            {
                success = false,
                message = "Cập nhật Khóa Học thất bại.",
                data = (object)null
            });
        }
        catch (BusinessRuleViolationException ex)
        {
            return BadRequest(new
            {
                success = false,
                message = ex.Message,
                data = (object)null
            });
        }
        catch (EntityNotFoundException ex)
        {
            return NotFound(new
            {
                success = false,
                message = ex.Message,
                data = (object)null
            });
        }
    }

    [Authorize(Roles = "Admin,Manager")]
    [HttpDelete("DeleteCourse")]
    public async Task<IActionResult> DeleteCourse([FromQuery] int id)
    {
        var result = await _courseService.DeleteCourse(id);
        if (result)
        {
            return Ok(new
            {
                success = true,
                message = "Xóa Khóa Học thành công.",
                data = (object)null
            });
        }

        return NotFound(new
        {
            success = false,
            message = "Xóa Khóa Học thất bại hoặc không tồn tại.",
            data = (object)null
        });
    }

    [HttpGet("IsGetCourse")]
    public async Task<IActionResult> IsGetCourse([FromQuery] double score)
    {
        var isSuggest = await _courseService.IsGetCourse(score);
        return Ok(new
        {
            success = true,
            message = "Đánh giá khả năng lấy khóa học.",
            data = isSuggest
        });
    }

    [HttpGet("GetCoursesByAge")]
    public async Task<IActionResult> GetCoursesByAge([FromQuery] int age)
    {
        var courses = await _courseService.GetCoursesByAge(age);
        return Ok(new
        {
            success = true,
            message = "Lấy khóa học theo độ tuổi thành công.",
            data = courses
        });
    }
}
