using DrugUsePreventionAPI.Models.DTOs.Blog;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using DrugUsePreventionAPI.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class BlogService : IBlogService
    {
        private readonly IBlogRepository _repository;

        public BlogService(IBlogRepository repository)
        {
            _repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }

        // ✅ Lấy tất cả blog, không lọc theo status
        public async Task<IEnumerable<BlogResponseDTO>> GetBlogsAsync()
        {
            var blogs = await _repository.GetAllAsync();
            return blogs.Select(MapToDTO);
        }

        // ✅ MỚI THÊM: Lọc theo trạng thái
        public async Task<IEnumerable<BlogResponseDTO>> GetBlogsByStatusAsync(string status)
        {
            IEnumerable<Blog> blogs;

            if (string.Equals(status, "All", StringComparison.OrdinalIgnoreCase))
            {
                blogs = await _repository.GetAllAsync();
            }
            else if (string.Equals(status, "Active", StringComparison.OrdinalIgnoreCase))
            {
                blogs = await _repository.GetActiveBlogsAsync();
            }
            else if (string.Equals(status, "Inactive", StringComparison.OrdinalIgnoreCase))
            {
                var allBlogs = await _repository.GetAllAsync();
                blogs = allBlogs.Where(b => b.Status == "Inactive");
            }
            else
            {
                throw new ArgumentException("Status must be 'Active', 'Inactive', or 'All'");
            }

            return blogs.Select(MapToDTO);
        }

        // ✅ Lấy blog theo ID
        public async Task<BlogResponseDTO> GetBlogByIdAsync(int id)
        {
            var blog = await _repository.GetByIdAsync(id);
            return blog != null ? MapToDTO(blog) : null;
        }

        // ✅ Thêm blog mới
        public async Task AddBlogAsync(Blog blog)
        {
            if (blog == null)
                throw new ArgumentNullException(nameof(blog));

            if (string.IsNullOrWhiteSpace(blog.Title) || string.IsNullOrWhiteSpace(blog.Content))
                throw new ArgumentException("Title and Content are required.", nameof(blog));

            if (blog.Status != "Active" && blog.Status != "Inactive")
                throw new ArgumentException("Status must be 'Active' or 'Inactive'.", nameof(blog));

            await _repository.AddAsync(blog);
        }

        // ✅ Cập nhật blog
        public async Task<bool> UpdateBlogAsync(int id, Blog blog)
        {
            if (blog == null)
                throw new ArgumentNullException(nameof(blog));

            if (id != blog.BlogID)
                throw new ArgumentException("Blog ID mismatch.", nameof(blog));

            if (string.IsNullOrWhiteSpace(blog.Title) || string.IsNullOrWhiteSpace(blog.Content))
                throw new ArgumentException("Title and Content are required.", nameof(blog));

            if (blog.Status != "Active" && blog.Status != "Inactive")
                throw new ArgumentException("Status must be 'Active' or 'Inactive'.", nameof(blog));

            var existingBlog = await _repository.GetByIdAsync(id);
            if (existingBlog == null)
                return false;

            existingBlog.Title = blog.Title;
            existingBlog.Content = blog.Content;
            existingBlog.CreatedBy = blog.CreatedBy;
            existingBlog.PublishDate = blog.PublishDate;
            existingBlog.Status = blog.Status;
            existingBlog.Thumbnail = blog.Thumbnail;
            existingBlog.AuthorAvatar = blog.AuthorAvatar;

            await _repository.UpdateAsync(existingBlog);
            return true;
        }

        // ✅ Xóa mềm blog
        public async Task<bool> DeleteBlogAsync(int id)
        {
            var blog = await _repository.GetByIdAsync(id);
            if (blog == null)
                return false;

            await _repository.SoftDeleteAsync(blog);
            return true;
        }

        // ✅ Hàm chuyển đổi Entity → DTO
        private BlogResponseDTO MapToDTO(Blog b)
        {
            return new BlogResponseDTO
            {
                BlogID = b.BlogID,
                Title = b.Title,
                Content = b.Content,
                CreatedBy = b.CreatedBy,
                PublishDate = b.PublishDate,
                Status = b.Status,
                Thumbnail = b.Thumbnail,
                AuthorAvatar = b.AuthorAvatar
            };
        }
    }
}
