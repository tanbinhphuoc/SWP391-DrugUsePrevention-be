using DrugUsePreventionAPI.Models.DTOs.Blog;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Services
{
    public class BlogService : IBlogService
    {
        private readonly IBlogRepository _repository;

        public BlogService(IBlogRepository repository)
        {
            _repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }

        public async Task<IEnumerable<BlogResponseDTO>> GetBlogsAsync()
        {
            var blogs = await _repository.GetActiveBlogsAsync();
            return blogs.Select(b => new BlogResponseDTO
            {
                BlogID = b.BlogID,
                Title = b.Title,
                Content = b.Content,
                CreatedBy = b.CreatedBy,
                PublishDate = b.PublishDate,
                Status = b.Status,
                Thumbnail = b.Thumbnail,
                AuthorAvatar = b.AuthorAvatar
            });
        }

        public async Task<BlogResponseDTO> GetBlogByIdAsync(int id)
        {
            var blog = await _repository.GetByIdWithActiveStatusAsync(id);
            return blog != null ? new BlogResponseDTO
            {
                BlogID = blog.BlogID,
                Title = blog.Title,
                Content = blog.Content,
                CreatedBy = blog.CreatedBy,
                PublishDate = blog.PublishDate,
                Status = blog.Status,
                Thumbnail = blog.Thumbnail,
                AuthorAvatar = blog.AuthorAvatar
            } : null;
        }

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
            if (existingBlog == null || existingBlog.Status != "Active")
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

        public async Task<bool> DeleteBlogAsync(int id)
        {
            var blog = await _repository.GetByIdWithActiveStatusAsync(id);
            if (blog == null)
                return false;

            await _repository.SoftDeleteAsync(blog);
            return true;
        }
    }
}
