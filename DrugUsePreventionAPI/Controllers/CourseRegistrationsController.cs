using DrugUsePreventionAPI.Models.DTOs.CourseRegistration;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace DrugUsePreventionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseRegistrationsController : ControllerBase
    {
        private readonly ICourseRegistrationService _courseRegistrationService;

        public CourseRegistrationsController(ICourseRegistrationService courseRegistrationService)
        {
            _courseRegistrationService = courseRegistrationService;
        }

        [HttpPost]
        public async Task<IActionResult> CreateCourseRegistration(CreateCourseRegistrationDto createCourseRegistrationDto)
        {
            try
            {
                await _courseRegistrationService.CreateCourseRegistrationAsync(createCourseRegistrationDto);
                return Ok("Đăng kí khóa học thành công");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }

}