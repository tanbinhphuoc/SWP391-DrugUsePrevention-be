// Controller: AssessmentController.cs
using Microsoft.AspNetCore.Mvc;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Models.DTOs.AssessmentDto;
using DrugUsePreventionAPI.Models.DTOs.Assessment;
using DrugUsePreventionAPI.Exceptions;
using Microsoft.AspNetCore.Authorization;
using Serilog;

namespace DrugUsePreventionAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AssessmentController : ControllerBase
    {
        private readonly IAssessmentService _assessmentService;

        public AssessmentController(IAssessmentService assessmentService)
        {
            _assessmentService = assessmentService;
        }

        [HttpPost("CreateInputAssessment")]
        public async Task<IActionResult> CreateInputAssessment([FromBody] CreateInputAssessmentDto dto)
        {
            var result = await _assessmentService.CreateInputAssessment(dto);
            if (!result.IsSuccess)
                return BadRequest(new
                {
                    success = false,
                    message = result.Message
                });

            return Ok(new
            {
                success = true,
                message = result.Message,
                assessmentId = result.AssessmentId
            });
        }


        [HttpPost("CreateOutputAssessment")]
        public async Task<IActionResult> CreateOutputAssessment([FromBody] CreateOutputAssessmentDto dto)
        {
            var result = await _assessmentService.CreateOutputAssessment(dto);
            if (!result.IsSuccess)
                return BadRequest(new
                {
                    success = false,
                    message = result.Message
                });

            return Ok(new
            {
                success = true,
                message = result.Message,
                assessmentId = result.AssessmentId
            });
        }


        [Authorize(Roles = "Admin")]
        [HttpPut("UpdateInputAssessment/{id}")]
        public async Task<IActionResult> UpdateInputAssessment(int id, [FromBody] CreateInputAssessmentDto dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(new { success = false, message = "Dữ liệu không hợp lệ" });

            try
            {
                var result = await _assessmentService.UpdateInputAssessmentWithValidation(id, dto);
                if (!result)
                    return BadRequest(new { success = false, message = "Cập nhật thất bại" });

                return Ok(new { success = true, message = "Cập nhật Assessment thành công" });
            }
            catch (EntityNotFoundException ex)
            {
                return NotFound(new { success = false, message = ex.Message });
            }
            catch (BusinessRuleViolationException ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Lỗi không xác định khi cập nhật Assessment");
                return StatusCode(500, new { success = false, message = "Lỗi server nội bộ" });
            }
        }


        [HttpPut("UpdateOutputAssessment/{id}")]
        public async Task<IActionResult> UpdateOutputAssessment(int id, [FromBody] CreateOutputAssessmentDto dto)
        {
            var result = await _assessmentService.UpdateOutputAssessmentWithValidation(id, dto);
            if (!result.IsSuccess)
                return BadRequest(new
                {
                    success = false,
                    message = result.Message
                });

            return Ok(new
            {
                success = true,
                message = result.Message
            });
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAssessment(int id)
        {
            var success = await _assessmentService.DeleteAssessment(id);
            if (!success)
                return NotFound(new { success = false, message = "Assessment không tồn tại" });

            return Ok(new { success = true, message = "Xóa thành công" });
        }

        [HttpGet("GetById/{id}")]
        public async Task<IActionResult> GetAssessmentById(int id)
        {
            var dto = await _assessmentService.GetAssessmentById(id);
            if (dto == null)
                return NotFound(new { success = false, message = "Assessment không tồn tại" });

            return Ok(new { success = true, data = dto });
        }

        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAllAssessments()
        {
            var result = await _assessmentService.GetAllAssessmentWithCourse();
            return Ok(new { success = true, data = result });
        }

        [HttpGet("GetByAge/{age}")]
        public async Task<IActionResult> GetByAge(int age)
        {
            var assessments = await _assessmentService.GetAssessmentByAge(age);
            return Ok(new { success = true, data = assessments });
        }
    }
}
