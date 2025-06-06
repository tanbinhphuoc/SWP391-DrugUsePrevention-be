﻿using System.Runtime.InteropServices;
using DrugUsePreventionAPI.Models.DTOs.AssessmentDto;
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
                return Ok("Tạo Assessment thành công");
            return BadRequest("Tạo Assessment thất bại");
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpPut("UpdateAssessment")]
        public async Task<IActionResult> UpdateAsessment(int id, [FromBody] CreateAssessmentDto assessmentDto)
        {
            var result = await _assessmentService.UpdateAssessment(id,assessmentDto);
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
                return BadRequest("Không tìm thấy Assessment ");
            }
            return Ok(assessment);
        }

        [Authorize(Roles = "Admin,Manager")]
        [HttpDelete("DeleteAssessment")]
        public async Task<IActionResult> DeleteCourse( int id)
        {
            var result = await _assessmentService.DeleteAssessment(id);
            if (result)
                return Ok(new { message = "Xóa Assessment Thành Công." });
            return BadRequest(new { message = "Xóa Assessment Thất Bại." });
        }
        /// <summary>
        /// lấy assm theo độ tuổi
        /// </summary>
        /// <param name="age" độ tuổi của user ></param>
        /// <returns> Nếu user dưới 18 tuổi sẽ đưa ra danh sách những bài Assist, trên 20 tuổi sẽ đưa ra danh sách các bài Craft </returns>
        //[Authorize(Roles = "Admin,Manager")]
        [HttpGet("GetAssessmentByAge")]
        public async Task<IActionResult> GetAssessmentByAge(int age)
        {
            var assessment = await _assessmentService.GetAssessmentByAge(age);
            return Ok(assessment);
        }
    }
}
