using DrugUsePreventionAPI.Models.DTOs.Blog;
using DrugUsePreventionAPI.Models.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IBlogService
    {
        Task<IEnumerable<BlogResponseDTO>> GetBlogsAsync(); // Mặc định: Active
        Task<IEnumerable<BlogResponseDTO>> GetBlogsByStatusAsync(string status);
        Task<BlogResponseDTO> GetBlogByIdAsync(int id);
        Task AddBlogAsync(Blog blog);
        Task<bool> UpdateBlogAsync(int id, Blog blog);
        Task<bool> DeleteBlogAsync(int id);
    }
}
