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
    }

}
