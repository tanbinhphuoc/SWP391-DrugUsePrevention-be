using DrugUsePreventionAPI.Models.DTO.UserCourseProgress;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IUserCourseProgressService
    {
        Task<bool> MarkCourseAsCompletedAsync(UpdateUserCourseProgressDto dto);
    }
}
