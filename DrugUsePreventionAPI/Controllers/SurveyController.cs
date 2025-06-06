using DrugUsePreventionAPI.Models.DTOs.Question;
using DrugUsePreventionAPI.Models.DTOs.Survey;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Implementations;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SurveyController : ControllerBase
    {
        private readonly ISurveyService _surveyService;

        public SurveyController(ISurveyService surveyService)
        {
            _surveyService = surveyService;
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpPost("CreateSurvey")]
        public async Task<IActionResult> CreateSurvey([FromBody] CreateSurveyDto createSurveyDto)
        {
            var result = await _surveyService.CreateSurvey(createSurveyDto);
            if (result)
                return Ok("Tạo Survey Thành Công.");
            return BadRequest("Tạo Survey Thất Bại.");
        }

        [AllowAnonymous]
        [HttpGet("GetAllSurvey")]
        public async Task<ActionResult<List<Survey>>> GetAllSurvey()
        {
            var survey = await _surveyService.GetAllSurvey();
            return Ok(survey);
        }

        [AllowAnonymous]
        [HttpGet("GetSurveyByID")]
        public async Task<ActionResult<Survey>> GetSurveyById([FromQuery] int id)
        {
            var survey = await _surveyService.GetSurveyById(id);
            if (survey == null)
                return NotFound(new { message = "Survey Không Tồn Tại." });
            return Ok(survey);
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpPut("UpdateSurvey")]
        public async Task<IActionResult> UpdateSurvey([FromQuery] int id, [FromBody] CreateSurveyDto createSurveyDto)
        {
            var result = await _surveyService.UpdateSurvey(id, createSurveyDto);
            if (result)
                return Ok(new { message = "Cập Nhật Survey Thành Công" });
            return NotFound(new { message = "Cập Nhật Survey Thất Bại" });
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpDelete("DeleteSurvey")]
        public async Task<IActionResult> DeleteSurvey([FromQuery] int id)
        {
            var result = await _surveyService.DeleteSurvey(id);
            if (result)
                return Ok(new { message = "Xóa Survey Thành Công." });
            return NotFound(new { message = "Xóa Survey Thất Bại." });
        }
    }
}
