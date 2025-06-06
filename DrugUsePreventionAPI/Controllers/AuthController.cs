    using DrugUsePreventionAPI.Models.DTOs.Auth;
    using DrugUsePreventionAPI.Models.DTOs.User;
    using DrugUsePreventionAPI.Services.Interfaces;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;

    namespace DrugUsePreventionAPI.Controllers
    {
        [ApiController]
        [Route("api/[controller]")]
        public class AuthController : ControllerBase
        {
            private readonly IAuthService _authService;

            public AuthController(IAuthService authService)
            {
                _authService = authService;
            }

            [HttpPost("login")]
            public async Task<IActionResult> Login([FromBody] LoginDto loginDto)
            {
                try
                {
                    var token = await _authService.LoginAsync(loginDto);
                    return Ok(token);
                }
                catch (UnauthorizedAccessException ex)
                {
                    return Unauthorized(new { message = ex.Message });
                }
            }

            [HttpPost("register")]
            public async Task<IActionResult> Register([FromBody] RegisterDto registerDto)
            {
                try
                {
                    var token = await _authService.RegisterAsync(registerDto);
                    return Ok(token);
                }
                catch (InvalidOperationException ex)
                {
                    return BadRequest(new { message = ex.Message });
                }
            }

            [HttpPost("admin/create-user")]
            [Authorize(Roles = "Admin")]
            public async Task<IActionResult> CreateUserByAdmin([FromBody] CreateUserByAdminDto dto)
            {
                try
                {
                    var user = await _authService.CreateUserByAdminAsync(dto);
                    return Ok(user);
                }
                catch (InvalidOperationException ex)
                {
                    return BadRequest(new { message = ex.Message });
                }
            }
        }
    }
