using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IBlogService
    {
        Task<IEnumerable<Blog>> GetBlogsAsync();
        Task AddBlogAsync(Blog blog);
        Task<bool> UpdateBlogAsync(int id, Blog blog);
        Task<bool> DeleteBlogAsync(int id);
        Task<Blog?> GetBlogByIdAsync(int id);
    }
}
