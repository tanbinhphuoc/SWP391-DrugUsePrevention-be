using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DrugUsePreventionAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CourseStatisticsController : ControllerBase
    {
        private readonly ICourseStatisticsService _courseStatisticsService;

        public CourseStatisticsController(ICourseStatisticsService courseStatisticsService)
        {
            _courseStatisticsService = courseStatisticsService;
        }

        [HttpGet("overview")]
        public async Task<IActionResult> GetCourseOverview()
        {
            var result = await _courseStatisticsService.GetCourseOverviewStatisticsAsync();
            return Ok(result);
        }

        [HttpGet("users-per-course")]
        public async Task<IActionResult> GetCourseUserStatistics()
        {
            var result = await _courseStatisticsService.GetCourseUserStatisticsAsync();
            return Ok(result);
        }

        [HttpGet("impact")]
        public async Task<IActionResult> GetCoursesWithHighestImpact()
        {
            var result = await _courseStatisticsService.GetCoursesWithHighestImpactAsync();
            return Ok(result);
        }

        [HttpGet("revenue")]
        public async Task<IActionResult> GetRevenueStatistics()
        {
            var result = await _courseStatisticsService.GetRevenueStatisticsAsync();
            return Ok(result);
        }

        [HttpGet("charts")]
        public async Task<IActionResult> GetChartStatistics()
        {
            var result = await _courseStatisticsService.GetChartStatisticsAsync();
            return Ok(result);
        }
    }

}