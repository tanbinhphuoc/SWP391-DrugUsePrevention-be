using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface IBlogRepository
    {
        Task<IEnumerable<Blog>> GetAllAsync();
        Task AddAsync(Blog blog);
        Task<Blog?> GetByIdAsync(int id);
        Task UpdateAsync(Blog blog);
        Task DeleteAsync(Blog blog);
    }
}
