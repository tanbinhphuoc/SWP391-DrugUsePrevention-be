using DrugUsePreventionAPI.Models.DTOs.Blog;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace DrugUsePreventionAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BlogController : ControllerBase
    {
        private readonly IBlogService _service;

        public BlogController(IBlogService service)
        {
            _service = service;
        }

        // GET: api/blog
        [HttpGet("list")]
        public async Task<IActionResult> GetBlogs()
        {
            var blogs = await _service.GetBlogsAsync();
            return Ok(blogs);
        }

        // GET: api/blog/{id}
        [HttpGet("{id}")]
        public async Task<IActionResult> GetBlogById(int id)
        {
            var blog = await _service.GetBlogByIdAsync(id);
            if (blog == null)
                return NotFound(new { message = $"Blog with id {id} not found" });

            return Ok(blog);
        }

        // POST: api/blog
        [HttpPost]
        public async Task<IActionResult> CreateBlog([FromBody] BlogCreateDTO dto)
        {
            if (dto == null || string.IsNullOrWhiteSpace(dto.Title) || string.IsNullOrWhiteSpace(dto.Content))
                return BadRequest("Invalid blog data");

            var blog = new Blog
            {
                Title = dto.Title,
                Content = dto.Content,
                AuthorID = dto.AuthorID,
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
                // Ghi log exception chi tiết
                return StatusCode(500, new
                {
                    message = "Failed to save blog",
                    error = ex.Message,
                    inner = ex.InnerException?.Message
                });
            }
        }

        // ✅ PUT: api/blog/5
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateBlog(int id, [FromBody] BlogUpdateDTO dto)
        {
            if (dto == null || id != dto.BlogID)
                return BadRequest("Invalid blog data");

            var blog = new Blog
            {
                BlogID = dto.BlogID,
                Title = dto.Title,
                Content = dto.Content,
                AuthorID = dto.AuthorID,
                PublishDate = dto.PublishDate,
                Status = dto.Status
            };

            var updated = await _service.UpdateBlogAsync(id, blog);
            if (!updated)
                return NotFound(new { message = $"Blog with id {id} not found" });

            return Ok(new { message = "Blog updated successfully" });
        }

        // ✅ DELETE: api/blog/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBlog(int id)
        {
            var deleted = await _service.DeleteBlogAsync(id);
            if (!deleted)
                return NotFound(new { message = $"Blog with id {id} not found" });

            return Ok(new { message = "Blog deleted successfully" });
        }
    }
}
