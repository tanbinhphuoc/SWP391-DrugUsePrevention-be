using DrugUsePreventionAPI.Models.DTOs.Assessment;
using DrugUsePreventionAPI.Models.DTOs.AssessmentDto;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AssessmentController : ControllerBase
    {
        private readonly IAssessmentService _assessmentService;

        public AssessmentController(IAssessmentService assessmentService)
        {
            _assessmentService = assessmentService;
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpPost("CreateInputAssessment")]
        public async Task<IActionResult> CreateInputAssessment([FromBody] CreateInputAssessmentDto dto)
        {
            var result = await _assessmentService.CreateInputAssessment(dto);
            if (result.IsSuccess)
                return Ok(new { success = true, message = result.Message, id = result.AssessmentId });

            return BadRequest(new { success = false, message = result.Message });
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpPost("CreateOutputAssessment")]
        public async Task<IActionResult> CreateOutputAssessment([FromBody] CreateOutputAssessmentDto dto)
        {
            var result = await _assessmentService.CreateOutputAssessment(dto);
            if (result.IsSuccess)
                return Ok(new { success = true, message = result.Message, id = result.AssessmentId });

            return BadRequest(new { success = false, message = result.Message });
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpPut("UpdateInputAssessment")]
        public async Task<IActionResult> UpdateInputAssessment(int id, [FromBody] CreateInputAssessmentDto dto)
        {
            if (dto.AssessmentStage != "Input")
                return BadRequest(new { success = false, message = "AssessmentStage phải là 'Input'" });

            var isUpdated = await _assessmentService.UpdateInputAssessment(id, dto);
            if (isUpdated)
                return Ok(new { success = true, message = "Cập nhật Assessment Input thành công" });

            return BadRequest(new { success = false, message = "Cập nhật Assessment Input thất bại" });
        }




        [Authorize(Roles = "Admin,Manager")]
        [HttpPut("UpdateOutputAssessment")]
        public async Task<IActionResult> UpdateOutputAssessment(int id, [FromBody] CreateOutputAssessmentDto dto)
        {
            // Đảm bảo đúng giai đoạn "Output"
            if (!string.Equals(dto.AssessmentStage, "Output", StringComparison.OrdinalIgnoreCase))
            {
                return BadRequest(new { success = false, message = "AssessmentStage phải là 'Output'" });
            }

            // CourseID bắt buộc với Output
            if (dto.CourseID is null || dto.CourseID <= 0)
            {
                return BadRequest(new { success = false, message = "Vui lòng nhập CourseID hợp lệ cho Assessment Output" });
            }

            var isUpdated = await _assessmentService.UpdateOutputAssessment(id, dto);

            if (isUpdated)
            {
                return Ok(new { success = true, message = "Cập nhật Assessment Output thành công" });
            }

            return BadRequest(new { success = false, message = "Cập nhật Assessment Output thất bại hoặc không tồn tại" });
        }


        [Authorize(Roles = "Admin,Manager")]
        [HttpGet("GetAllAssessment")]
        public async Task<IActionResult> GetAllAssessment()
        {
            var assessments = await _assessmentService.GetAllAssessmentWithCourse();
            return Ok(new { success = true, message = "Lấy danh sách thành công", data = assessments });
        }



        [HttpGet("GetAvailableCourses")]
        public async Task<IActionResult> GetAvailableCourses()
        {
            var courses = await _assessmentService.GetAvailableCourses();
            var courseList = courses.Select(c => new
            {
                c.CourseID,
                c.CourseName
            });

            return Ok(new { success = true, message = "Lấy danh sách khóa học thành công", data = courseList });
        }
        [HttpGet("GetAssessmentsByStage")]
        public async Task<IActionResult> GetAssessmentsByStage(string stage)
        {
            if (string.IsNullOrWhiteSpace(stage) ||
                (stage != "Input" && stage != "Output"))
            {
                return BadRequest(new { success = false, message = "Stage phải là 'Input' hoặc 'Output'" });
            }

            var all = await _assessmentService.GetAllAssessmentWithCourse();
            var filtered = all
                .Where(a => a.AssessmentStage == stage)
                .ToList();

            return Ok(new { success = true, message = "Lọc thành công", data = filtered });
        }


        [HttpGet("GetAssessmentByAge")]
        public async Task<IActionResult> GetAssessmentByAge(int age)
        {
            var assessment = await _assessmentService.GetAssessmentByAge(age);
            return Ok(new { success = true, message = "Lấy thành công", data = assessment });
        }

        [HttpGet("GetAssessmentFormById")]
        public async Task<IActionResult> GetAssessmentFormById(int id)
        {
            var result = await _assessmentService.GetAssessmentById(id);
            if (result == null)
                return NotFound(new { success = false, message = "Không tìm thấy bài đánh giá." });

            return Ok(new { success = true, message = "Lấy thành công", data = result });
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpDelete("DeleteAssessment")]
        public async Task<IActionResult> DeleteAssessment(int id)
        {
            var result = await _assessmentService.DeleteAssessment(id);
            if (result)
                return Ok(new { success = true, message = "Xóa Assessment thành công." });

            return BadRequest(new { success = false, message = "Xóa Assessment thất bại hoặc không tồn tại." });
        }
    }
}
