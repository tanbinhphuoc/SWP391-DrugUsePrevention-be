using DrugUsePreventionAPI.Models.DTO.UserCourseProgresses;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserCourseProgressesController : ControllerBase
    {
        private readonly IUserCourseProgressesService _UserCourseProgressesService;

        public UserCourseProgressesController(IUserCourseProgressesService service)
        {
            _UserCourseProgressesService = service;
        }

        [HttpPost("complete")]
        public async Task<IActionResult> MarkAsCompleted([FromBody] UpdateUserCourseProgressesDto dto)
        {
            var result = await _UserCourseProgressesService.MarkCourseAsCompletedAsync(dto);
            if (!result)
                return NotFound(new { success = false, message = "User chưa đăng ký khóa học này." });

            return Ok(new { success = true, message = "Khóa học đã được đánh dấu là hoàn thành." });
        }
    }
}
