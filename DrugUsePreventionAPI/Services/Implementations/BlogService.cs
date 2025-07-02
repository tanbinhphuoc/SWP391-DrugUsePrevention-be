using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using DrugUsePreventionAPI.Services.Interfaces;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class BlogService : IBlogService
    {
        private readonly IBlogRepository _repo;

        public BlogService(IBlogRepository repo)
        {
            _repo = repo;
        }
        public async Task<Blog?> GetBlogByIdAsync(int id)
        {
            return await _repo.GetByIdAsync(id);
        }
        public async Task<IEnumerable<Blog>> GetBlogsAsync()
        {
            return await _repo.GetAllAsync();
        }

        public async Task AddBlogAsync(Blog blog)
        {
            blog.Author = null;
            await _repo.AddAsync(blog);
        }

        public async Task<bool> UpdateBlogAsync(int id, Blog blog)
        {
            var existing = await _repo.GetByIdAsync(id);
            if (existing == null) return false;

            existing.Title = blog.Title;
            existing.Content = blog.Content;
            existing.Status = blog.Status;
            existing.AuthorID = blog.AuthorID;
            existing.PublishDate = blog.PublishDate;

            await _repo.UpdateAsync(existing);
            return true;
        }

        public async Task<bool> DeleteBlogAsync(int id)
        {
            var existing = await _repo.GetByIdAsync(id);
            if (existing == null) return false;

            await _repo.DeleteAsync(existing);
            return true;
        }
    }
}
