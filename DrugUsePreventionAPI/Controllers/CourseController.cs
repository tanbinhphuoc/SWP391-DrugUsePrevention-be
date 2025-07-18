using DrugUsePreventionAPI.Exceptions;
using DrugUsePreventionAPI.Models.DTOs.Course;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
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

    [Authorize(Roles = "Admin,Manager,Staff")]
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

    [Authorize(Roles = "Admin,Manager,Staff")]
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

    [Authorize(Roles = "Admin,Manager,Staff")]
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

        if (courses == null || !courses.Any())
        {
            return Ok(new
            {
                success = false,
                message = "Không có khóa học nào phù hợp với độ tuổi của bạn.",
                data = new List<object>()
            });
        }

        return Ok(new
        {
            success = true,
            message = "Lấy khóa học theo độ tuổi thành công.",
            data = courses
        });
    }

    [HttpGet("completed/{userId}")]
    public async Task<ActionResult> GetCompletedCourses(int userId)
    {
        var courses = await _courseService.GetCompletedCoursesByUser(userId);

        if (courses == null || !courses.Any())
        {
            return NotFound(new
            {
                success = false,
                message = "Không có khóa học nào đã hoàn thành.",
                errors = new[] { "Người dùng chưa hoàn thành bất kỳ khóa học nào." }
            });
        }

        return Ok(new
        {
            success = true,
            message = "Danh sách khóa học đã hoàn thành.",
            data = courses
        });
    }

    [HttpGet("uncompleted/{userId}")]
    public async Task<ActionResult> GetUncompletedCourses(int userId)
    {
        var courses = await _courseService.GetUncompletedCoursesByUser(userId);

        if (courses == null || !courses.Any())
        {
            return NotFound(new
            {
                success = false,
                message = "Không có khóa học nào chưa hoàn thành.",
                errors = new[] { "Người dùng đã hoàn thành tất cả các khóa học hoặc không có khóa học nào." }
            });
        }

        return Ok(new
        {
            success = true,
            message = "Danh sách khóa học chưa hoàn thành.",
            data = courses
        });
    }

}
