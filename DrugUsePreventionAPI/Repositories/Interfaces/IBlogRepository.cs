using DrugUsePreventionAPI.Models.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface IBlogRepository
    {
        Task<IEnumerable<Blog>> GetAllAsync();
        Task<IEnumerable<Blog>> GetActiveBlogsAsync();
        Task AddAsync(Blog blog);
        Task<Blog?> GetByIdAsync(int id);
        Task<Blog?> GetByIdWithActiveStatusAsync(int id);
        Task UpdateAsync(Blog blog);
        Task SoftDeleteAsync(Blog blog);
        Task DeleteAsync(Blog blog);
    }
}
