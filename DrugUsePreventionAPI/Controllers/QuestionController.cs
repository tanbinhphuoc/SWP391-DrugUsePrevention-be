using DrugUsePreventionAPI.Models.DTOs.Answer;
using DrugUsePreventionAPI.Models.DTOs.Question;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuestionController : ControllerBase
    {
        private readonly IQuestionService _questionService;

        public QuestionController(IQuestionService questionForSurveyService)
        {
            _questionService = questionForSurveyService;

        }

        //CRUD Question for Survey
        [Authorize(Roles = "Admin,Manager")]
        [HttpPost("CreateQuestionForSurvey")]
        public async Task<IActionResult> CreateQuestionForSurvey([FromBody] CreateQuestionForSurveyDto createQuestionForSurveyDto)
        {
            var result = await _questionService.CreateQuestionForSurvey(createQuestionForSurveyDto);
            if (result)
                return Ok(new { message = "Tạo Question For Survey Thành Công." });
            return BadRequest(new { message = "Tạo Question For Survey Thất Bại." });
        }

        [AllowAnonymous]
        [HttpGet("GetAllQuestionForSurvey")]
        public async Task<ActionResult<List<Question>>> GetAllQuestionForSurvey()
        {
            var question = await _questionService.GetAllQuestionForSurvey();
            return Ok(question);
        }

        [AllowAnonymous]
        [HttpGet("GetQuestionForSurveyByID")]
        public async Task<ActionResult<Question>> GetQuestionForSurveyById([FromQuery] int id)
        {
            var questionForSurvey = await _questionService.GetQuestionForSurveyById(id);
            if (questionForSurvey == null)
                return NotFound(new { message = "Question Không Tồn Tại." });
            return Ok(questionForSurvey);
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpPut("UpdateQuestionForSurvey")]
        public async Task<IActionResult> UpdateQuestionForSurvey([FromQuery] int id, [FromBody] CreateQuestionForSurveyDto createQuestionForSurveyDto)
        {
            var result = await _questionService.UpdateQuestionForSurvey(id, createQuestionForSurveyDto);
            if (result)
                return Ok(new { message = "Cập Nhật AnswerOption Thành Công" });
            return NotFound(new { message = "Cập Nhật AnswerOption Thất Bại" });
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpDelete("DeleteQuestionForSurvey")]
        public async Task<IActionResult> DeleteQuestionForSurvey([FromQuery] int id)
        {
            var result = await _questionService.DeleteQuestionForSurvey(id);
            if (result)
                return Ok(new { message = "Xóa Question Thành Công." });
            return NotFound(new { message = "Xóa Question Thất Bại." });
        }


        //CRUD Question for Assessment
        [Authorize(Roles = "Admin,Manager")]
        [HttpPost("CreateQuestionForAssessment")]
        public async Task<IActionResult> CreateQuestionForAssessment([FromBody] CreateQuestionForAssessmentDto createQuestionForAssessmentDto)
        {
            var result = await _questionService.CreateQuestionForAssessment(createQuestionForAssessmentDto);
            if (result)
                return Ok(new { message = "Tạo Question Thành Công." });
            return BadRequest(new { message = "Tạo Question Thất Bại." });
        }

        [AllowAnonymous]
        [HttpGet("GetAllQuestionForAssessment")]
        public async Task<ActionResult<List<Question>>> GetAllQuestionForAssessment()
        {
            var questionForAssessment = await _questionService.GetAllQuestionForAssessment();
            return Ok(questionForAssessment);
        }

        [AllowAnonymous]
        [HttpGet("GetQuestionForAssessmentByID")]
        public async Task<ActionResult<Question>> GetQuestionForAssessmentById([FromQuery] int id)
        {
            var questionForAssessment = await _questionService.GetQuestionForAssessmentById(id);
            if (questionForAssessment == null)
                return NotFound(new { message = "Question Không Tồn Tại." });
            return Ok(questionForAssessment);
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpPut("UpdateQuestionForAssessment")]
        public async Task<IActionResult> UpdateQuestionForAssessment([FromQuery] int id, [FromBody] CreateQuestionForAssessmentDto createQuestionForAssessmentDto)
        {
            var result = await _questionService.UpdateQuestionForAssessment(id, createQuestionForAssessmentDto);
            if (result)
                return Ok(new { message = "Cập Nhật AnswerOption Thành Công" });
            return NotFound(new { message = "Cập Nhật AnswerOption Thất Bại" });
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpDelete("DeleteQuestionForAssessment")]
        public async Task<IActionResult> DeleteQuestionForAssessment([FromQuery] int id)
        {
            var result = await _questionService.DeleteQuestionForAssessment(id);
            if (result)
                return Ok(new { message = "Xóa Question Thành Công." });
            return NotFound(new { message = "Xóa Question Thất Bại." });
        }
    }
}
