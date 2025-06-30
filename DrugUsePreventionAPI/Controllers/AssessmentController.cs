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
        [HttpPost("CreateAssessment")]
        public async Task<IActionResult> CreateAssessment(CreateAssessmentDto assessmentDto)
        {
            if (string.IsNullOrWhiteSpace(assessmentDto.AssessmentStage) ||
                (assessmentDto.AssessmentStage != "Input" && assessmentDto.AssessmentStage != "Output"))
            {
                return BadRequest(new { message = "AssessmentStage phải là 'Input' hoặc 'Output'" });
            }

            if (assessmentDto.AssessmentStage == "Output" && !assessmentDto.CourseID.HasValue)
            {
                return BadRequest(new { message = "Vui lòng nhập CourseID cho Assessment Output" });
            }

            var result = await _assessmentService.CreateAssessment(assessmentDto);

            if (result.Equals("Tạo Assessment thành công", StringComparison.OrdinalIgnoreCase))
                return Ok(new { message = result });

            return BadRequest(new { message = result });
        }





        [Authorize(Roles = "Admin,Manager")]
        [HttpPut("UpdateAssessment")]
        public async Task<IActionResult> UpdateAsessment(int id, [FromBody] CreateAssessmentDto assessmentDto)
        {
            if (string.IsNullOrWhiteSpace(assessmentDto.AssessmentStage) ||
                (assessmentDto.AssessmentStage != "Input" && assessmentDto.AssessmentStage != "Output"))
            {
                return BadRequest(new { message = "AssessmentStage phải là 'Input' hoặc 'Output'" });
            }

            if (assessmentDto.AssessmentStage == "Output" && !assessmentDto.CourseID.HasValue)
            {
                return BadRequest(new { message = "Vui lòng nhập CourseID cho Assessment Output" });
            }

            var isUpdated = await _assessmentService.UpdateAssessment(id, assessmentDto);
            if (isUpdated)
                return Ok(new { message = "Cập nhật Assessment thành công" });

            string stage = assessmentDto.AssessmentStage == "Input" ? "đầu vào" : "đầu ra";
            string type = assessmentDto.AssessmentType;
            string courseInfo = assessmentDto.AssessmentStage == "Output" ? $" cho khóa học {assessmentDto.CourseID}" : "";

            return BadRequest(new { message = $"Cập nhật thất bại. Đã tồn tại Assessment {stage} loại {type}{courseInfo}." });
        }


        [Authorize(Roles = "Admin,Manager")]
        [HttpGet("GetAllAssessment")]
        public async Task<ActionResult<List<Assessment>>> GetAllAssessment()
        {
            var assessment = await _assessmentService.GetAllAssessment();
            return Ok(new { message = assessment });
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

            return Ok(new { message = courseList });
        }


        [HttpGet("GetAssessmentsByStage")]
        public async Task<IActionResult> GetAssessmentsByStage(string stage)
        {
            if (string.IsNullOrWhiteSpace(stage) ||
                (stage != "Input" && stage != "Output"))
            {
                return BadRequest(new { message = "Stage phải là 'Input' hoặc 'Output'" });
            }

            var all = await _assessmentService.GetAllAssessment();
            var filtered = all
                .Where(a => a.AssessmentStage == stage && !a.IsDeleted)
                .ToList();

            return Ok(new { message = filtered });
        }
        [HttpGet("GetAssessmentByAge")]
        public async Task<IActionResult> GetAssessmentByAge(int age)
        {
            var assessment = await _assessmentService.GetAssessmentByAge(age);
            return Ok(new { message = assessment });
        }

        [HttpGet("GetAssessmentFormById")]
        public async Task<IActionResult> GetAssessmentFormById(int id)
        {
            var result = await _assessmentService.GetAssessmentById(id);
            if (result == null)
                return NotFound(new { message = "Không tìm thấy bài đánh giá." });

            return Ok(new { message = result });
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpDelete("DeleteAssessment")]
        public async Task<IActionResult> DeleteAssessment(int id)
        {
            var result = await _assessmentService.DeleteAssessment(id);
            if (result)
                return Ok(new { message = "Xóa Assessment thành công." });

            return BadRequest(new { message = "Xóa Assessment thất bại hoặc không tồn tại." });
        }


        
    }

}