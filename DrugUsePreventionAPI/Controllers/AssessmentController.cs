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
            var result = await _assessmentService.CreateAssessment(assessmentDto);
            if (result)
                return Ok(new { message = "Tạo Assessment thành công" });
            return BadRequest(new { message = "Tạo Assessment thất bại" });
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpPut("UpdateAssessment")]
        public async Task<IActionResult> UpdateAsessment(int id, [FromBody] CreateAssessmentDto assessmentDto)
        {
            var result = await _assessmentService.UpdateAssessment(id, assessmentDto);
            if (result)
                return Ok(new { mesage = "Cập nhật Assessment thành công" });

            return BadRequest(new { mesage = "Cập nhật Assessment thất bại" });
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpGet("GetAllAssessment")]
        public async Task<ActionResult<List<Assessment>>> GetAllAssessment()
        {
            var assessment = await _assessmentService.GetAllAssessment();
            return Ok(assessment);
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpGet("GetGetAssessmentById")]
        public async Task<ActionResult<Assessment>> GetAssessmentById(int id)
        {
            var assessment = await _assessmentService.GetAssessmentById(id);
            if (assessment == null)
            {
                return BadRequest(new { message = "Không tìm thấy Assessment " });
            }
            return Ok(assessment);
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpDelete("DeleteAssessment")]
        public async Task<IActionResult> DeleteCourse(int id)
        {
            var result = await _assessmentService.DeleteAssessment(id);
            if (result)
                return Ok(new { message = "Xóa Assessment Thành Công." });
            return BadRequest(new { message = "Xóa Assessment Thất Bại." });
        }

        [HttpGet("GetAssessmentByAge")]
        public async Task<IActionResult> GetAssessmentByAge(int age)
        {
            var assessment = await _assessmentService.GetAssessmentByAge(age);
            return Ok(assessment);
        }

        [HttpGet("GetAssessmentFormById")]
        public async Task<IActionResult> GetAssessmentFormById(int id)
        {
            var result = await _assessmentService.GetAssessmentById(id);
            if (result == null)
                return NotFound(new { message = "Không tìm thấy bài đánh giá." }); 

            return Ok(result);
        }
    }

}