using DrugUsePreventionAPI.Services.Implementations;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DrugUsePreventionAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AssessmentStatisticsController : ControllerBase
    {
        private readonly IAssessmentStatisticsService _service;

        public AssessmentStatisticsController(IAssessmentStatisticsService service)
        {
            _service = service;
        }

        [HttpGet("total")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetTotalAssessments()
        {
            try
            {
                var total = await _service.GetTotalAssessmentsAsync();
                if (total == 0)
                    return NotFound(new { success = false, message = "Không có bài đánh giá nào." });

                return Ok(new { success = true, totalAssessments = total });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Lỗi khi lấy tổng số bài đánh giá.", details = ex.Message });
            }
        }

        [HttpGet("score-summary")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetAssessmentScoreSummary()
        {
            try
            {
                var summary = await _service.GetAssessmentScoreSummaryAsync();
                if (summary.TotalAssessments == 0)
                    return NotFound(new { success = false, message = "Không có dữ liệu để thống kê điểm." });

                return Ok(new { success = true, data = summary });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Lỗi khi lấy thống kê điểm.", details = ex.Message });
            }
        }

        [HttpGet("high-risk")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetHighRiskPercentage([FromQuery] double threshold = 4.0)
        {
            if (threshold < 0 || threshold > 10)    
                return BadRequest(new { success = false, message = "Ngưỡng nguy cơ phải nằm trong khoảng từ 0 đến 10." });

            try
            {
                var result = await _service.GetHighRiskSummaryAsync(threshold);
                return Ok(new { success = true, data = result });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Lỗi khi tính tỷ lệ nguy cơ cao.", details = ex.Message });
            }
        }

        [HttpGet("by-type")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetAssessmentByType()
        {
            try
            {
                var result = await _service.GetAssessmentCountsByTypeAsync();
                if (result == null || !result.Any())
                    return NotFound(new { success = false, message = "Không tìm thấy dữ liệu theo loại đánh giá." });

                return Ok(new { success = true, data = result });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Lỗi khi thống kê theo loại.", details = ex.Message });
            }
        }

        [HttpGet("by-age")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetScoreDistributionByAge()
        {
            try
            {
                var result = await _service.GetScoreDistributionByAgeAsync();
                if (result == null || !result.Any())
                    return NotFound(new { success = false, message = "Không có dữ liệu phân bố điểm theo độ tuổi." });

                return Ok(new { success = true, data = result });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Lỗi khi thống kê theo độ tuổi.", details = ex.Message });
            }
        }

        [HttpGet("score-changes")]
        [Authorize(Roles = "Admin,Manager,Staff")]
        public async Task<IActionResult> GetAssessmentScoreChanges()
        {
            var result = await _service.GetAssessmentScoreChangesAsync();
            return Ok(result);
        }

    }

}
