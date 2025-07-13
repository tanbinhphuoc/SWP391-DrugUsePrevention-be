using DrugUsePreventionAPI.Models.DTO.UserCourseProgress;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserCourseProgressController : ControllerBase
    {
        private readonly IUserCourseProgressService _userCourseProgressService;

        public UserCourseProgressController(IUserCourseProgressService service)
        {
            _userCourseProgressService = service;
        }

        [HttpPost("complete")]
        public async Task<IActionResult> MarkAsCompleted([FromBody] UpdateUserCourseProgressDto dto)
        {
            var result = await _userCourseProgressService.MarkCourseAsCompletedAsync(dto);
            if (!result)
                return NotFound(new { success = false, message = "User chưa đăng ký khóa học này." });

            return Ok(new { success = true, message = "Khóa học đã được đánh dấu là hoàn thành." });
        }
    }
}
