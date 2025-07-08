using DrugUsePreventionAPI.Models.DTOs.Answer;
using DrugUsePreventionAPI.Models.DTOs.Question;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
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
            return Ok(new { message = questionForAssessment });
        }

        [HttpGet("GetQuestionsByAssessmentId/{assessmentId}")]
        public async Task<IActionResult> GetQuestionsByAssessmentId(int assessmentId)
        {
            var result = await _questionService.GetAllQuestionsWithAnswersForAssessmentId(assessmentId);
            return Ok(new { success = true, message = "Lấy danh sách câu hỏi thành công", data = result });
        }



        [HttpPut("UpdateMultipleQuestions")]
        public async Task<IActionResult> UpdateMultipleQuestions([FromBody] List<CreateQuestionWithAnswersDto> questions)
        {
            try
            {
                var result = await _questionService.UpdateMultipleQuestionsWithAnswers(questions);
                return Ok(new { success = result, message = "Cập nhật câu hỏi thành công." });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
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

        [HttpPost("CreateMultipleQuestionsWithAnswers")]
        public async Task<IActionResult> CreateMultipleQuestionsWithAnswers([FromBody] List<CreateQuestionWithAnswersDto> dtoList)
        {
            if (dtoList == null || !dtoList.Any())
            {
                return BadRequest(new { success = false, message = "Danh sách câu hỏi không được để trống." });
            }

            try
            {
                var result = await _questionService.CreateMultipleQuestionsWithAnswers(dtoList);
                if (result)
                    return Ok(new { success = true, message = "Tạo câu hỏi và đáp án thành công." });

                return BadRequest(new { success = false, message = "Không thể tạo câu hỏi." });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

    }

}