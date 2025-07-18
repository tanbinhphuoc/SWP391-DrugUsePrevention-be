using DrugUsePreventionAPI.Models.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface IUserCourseProgressesRepository : IGenericRepository<UserCourseProgresses>
    {
        Task<List<UserCourseProgresses>> GetProgressByUserIdAsync(int userId);
        Task<List<UserCourseProgresses>> GetCompletedCoursesByUserAsync(int userId);
        Task<UserCourseProgresses> GetByUserAndCourseAsync(int userId, int courseId);

    }
}
