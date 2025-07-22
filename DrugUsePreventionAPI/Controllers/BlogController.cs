using DrugUsePreventionAPI.Models.DTOs.Blog;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace DrugUsePreventionAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class BlogController : ControllerBase
    {
        private readonly IBlogService _service;

        public BlogController(IBlogService service)
        {
            _service = service;
        }

        [HttpGet("ListOfBlog")]
        [Authorize(Roles = "Staff")]
        public async Task<IActionResult> GetBlogs()
        {
            var blogs = await _service.GetBlogsAsync();
            return Ok(blogs);
        }

        [HttpGet("{id}/GetBlogById")]
        [Authorize(Roles = "Staff")]
        public async Task<IActionResult> GetBlogById(int id)
        {
            var blog = await _service.GetBlogByIdAsync(id);
            if (blog == null)
                return NotFound(new { message = $"Blog with id {id} not found or is inactive" });

            return Ok(blog);
        }

        [HttpPost("CreateBlog")]
        [Authorize(Roles = "Staff")]
        public async Task<IActionResult> CreateBlog([FromBody] BlogCreateDTO dto)
        {
            if (dto == null || string.IsNullOrWhiteSpace(dto.Title) || string.IsNullOrWhiteSpace(dto.Content))
                return BadRequest(new { message = "Title and Content are required" });

            if (dto.Status != "Active" && dto.Status != "Inactive")
                return BadRequest(new { message = "Status must be 'Active' or 'Inactive'" });

            // Lấy UserID từ token JWT
            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (!int.TryParse(userIdClaim, out int userId))
                return Unauthorized(new { message = "Invalid user ID in token" });

            var blog = new Blog
            {
                Title = dto.Title,
                Content = dto.Content,
                CreatedBy = userId,
                PublishDate = dto.PublishDate,
                Status = dto.Status,
                Thumbnail = dto.Thumbnail,
                AuthorAvatar = dto.AuthorAvatar
            };

            try
            {
                await _service.AddBlogAsync(blog);
                return Ok(new { message = "Blog created successfully" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new
                {
                    message = "Failed to create blog",
                    error = ex.Message,
                    inner = ex.InnerException?.Message
                });
            }
        }

        [HttpPut("{id}/UpdateBlog")]
        [Authorize(Roles = "Staff")]
        public async Task<IActionResult> UpdateBlog(int id, [FromBody] BlogUpdateDTO dto)
        {
            if (dto == null || id != dto.BlogID || string.IsNullOrWhiteSpace(dto.Title) || string.IsNullOrWhiteSpace(dto.Content))
                return BadRequest(new { message = "Invalid blog data" });

            if (dto.Status != "Active" && dto.Status != "Inactive")
                return BadRequest(new { message = "Status must be 'Active' or 'Inactive'" });

            // Lấy UserID từ token JWT
            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (!int.TryParse(userIdClaim, out int userId))
                return Unauthorized(new { message = "Invalid user ID in token" });

            var blog = new Blog
            {
                BlogID = dto.BlogID,
                Title = dto.Title,
                Content = dto.Content,
                CreatedBy = userId,
                PublishDate = dto.PublishDate,
                Status = dto.Status,
                Thumbnail = dto.Thumbnail,
                AuthorAvatar = dto.AuthorAvatar
            };

            var updated = await _service.UpdateBlogAsync(id, blog);
            if (!updated)
                return NotFound(new { message = $"Blog with id {id} not found or is inactive" });

            return Ok(new { message = "Blog updated successfully" });
        }

        [HttpDelete("{id}/DeleteBlog")]
        [Authorize(Roles = "Staff")]
        public async Task<IActionResult> DeleteBlog(int id)
        {
            var deleted = await _service.DeleteBlogAsync(id);
            if (!deleted)
                return NotFound(new { message = $"Blog with id {id} not found or is already inactive" });

            return Ok(new { message = "Blog marked as inactive successfully" });
        }
    }
}
