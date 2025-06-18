using DrugUsePreventionAPI.Models.DTOs.AssessmentResultDto;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AssessmentResultsController : ControllerBase
    {
        private readonly IAssessmentResultService _assessmentResultService;
        public AssessmentResultsController(IAssessmentResultService assessmentResultService) { _assessmentResultService = assessmentResultService; }

        [HttpPost]
        public async Task<IActionResult> CreateAssessmentResult(CreateAssessmentResultDto dto)
        {
            var result = await _assessmentResultService.CreateAssessmentResult(dto);
            return Ok(result);
        }

        [HttpGet("compare-assessments")]
        public async Task<IActionResult> CompareAssessmentResults([FromQuery] int userId, [FromQuery] int courseId)
        {
            var result = await _assessmentResultService.CompareAssessmentResults(userId, courseId);
            if (result == null)
                return NotFound("Không tìm thấy kết quả đánh giá nào.");

            return Ok(result);
        }
    }

}