﻿using DrugUsePreventionAPI.Models.DTOs.Answer;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class AnswerOptionController : ControllerBase
    {
        private readonly IAnswerOptionService _answerOptionService;

        public AnswerOptionController(IAnswerOptionService answerOptionService)
        {
            _answerOptionService = answerOptionService;
        }

        [Authorize(Roles = "Admin,Manager,Staff")]
        [HttpPost("CreateAnswerOption")]
        public async Task<IActionResult> CreateAnswerOption([FromBody] CreateAnswerOptionDto createAnswerOptionDto)
        {
            var result = await _answerOptionService.CreateAnswerOption(createAnswerOptionDto);
            if (result)
                return Ok(new { message = "Tạo AnswerOption Thành Công." });
            return BadRequest(new { message = "Tạo AnswerOption Thất Bại." });
        }

        [Authorize(Roles = "Admin,Manager,Staff")]
        [HttpGet("GetAllAnswerOption")]
        public async Task<ActionResult<List<AnswerOption>>> GetAllAnswerOption()
        {
            var answerOption = await _answerOptionService.GetAllAnswerOption();
            return Ok(new { message = answerOption });
        }

        [Authorize(Roles = "Admin,Manager,Staff")]
        [HttpGet("GetAnswerOptionByID")]
        public async Task<ActionResult<AnswerOption>> GetAnswerOptionById([FromQuery] int id)
        {
            var answerOption = await _answerOptionService.GetAnswerOptionById(id);
            if (answerOption == null)
                return NotFound(new { message = "AnswerOption Không Tồn Tại." });
            return Ok(answerOption);
        }

        [Authorize(Roles = "Admin,Manager,Staff")]
        [HttpPut("UpdateAnswerOption")]
        public async Task<IActionResult> UpdateAnswerOption([FromQuery] int id, [FromBody] CreateAnswerOptionDto createAnswerOptionDto)
        {
            var result = await _answerOptionService.UpdateAnswerOption(id, createAnswerOptionDto);
            if (result)
                return Ok(new { message = "Cập Nhật AnswerOption Thành Công" });
            return NotFound(new { message = "Cập Nhật AnswerOption Thất Bại" });
        }

        [Authorize(Roles = "Admin,Manager,Staff")]
        [HttpDelete("DeleteAnswerOption")]
        public async Task<IActionResult> DeleteAnswerOption([FromQuery] int id)
        {
            var result = await _answerOptionService.DeleteAnswerOption(id);
            if (result)
                return Ok(new { message = "Xóa AnswerOption Thành Công." });
            return NotFound(new { message = "Xóa AnswerOption Thất Bại." });
        }
    }

}