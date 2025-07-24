using DrugUsePreventionAPI.Models.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface IUserCourseProgressesRepository : IGenericRepository<UserCourseProgress>
    {
        Task<List<UserCourseProgress>> GetProgressByUserIdAsync(int userId);
        Task<List<UserCourseProgress>> GetCompletedCoursesByUserAsync(int userId);
        Task<UserCourseProgress> GetByUserAndCourseAsync(int userId, int courseId);
    }
}
