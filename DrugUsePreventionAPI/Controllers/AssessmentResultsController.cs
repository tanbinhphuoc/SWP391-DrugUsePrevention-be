using DrugUsePreventionAPI.Models.DTOs.AssessmentResultDto;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class AssessmentResultsController : ControllerBase
    {
        private readonly IAssessmentResultService _assessmentResultService;
        public AssessmentResultsController(IAssessmentResultService assessmentResultService) { _assessmentResultService = assessmentResultService; }

        [HttpPost("create-input")]
        [Authorize(Roles = "Admin,Staff,Member")]
        public async Task<IActionResult> CreateInputResult([FromBody] CreateInputAssessmentResultDto dto)
        {
            try
            {
                var result = await _assessmentResultService.CreateInputAssessmentResult(dto);
                return Ok(new { success = true, message = result.Message, score = result.Score });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpPost("create-output")]
        [Authorize(Roles = "Admin,Staff,Member")]
        public async Task<IActionResult> CreateOutputResult([FromBody] CreateOutputAssessmentResultDto dto)
        {
            try
            {
                var result = await _assessmentResultService.CreateOutputAssessmentResult(dto);
                return Ok(new { success = true, message = result.Message, score = result.Score });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }


        [HttpGet("compare-assessments")]
        public async Task<IActionResult> CompareAssessmentResults([FromQuery] int userId, [FromQuery] int courseId)
        {
            var result = await _assessmentResultService.CompareAssessmentResults(userId, courseId);
            if (result == null)
                return NotFound(new { message = "Không tìm thấy kết quả đánh giá nào." });

            return Ok(new { message = result });
        }
        [HttpGet("is-eligible")]
        public async Task<IActionResult> IsEligibleForCourse([FromQuery] int userId)
        {
            var isEligible = await _assessmentResultService.IsEligibleForCourseAsync(userId);
            return Ok(new { isEligible });
        }

    }

}