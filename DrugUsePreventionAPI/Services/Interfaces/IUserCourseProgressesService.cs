using DrugUsePreventionAPI.Models.DTO.UserCourseProgresses;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IUserCourseProgressesService
    {
        Task<bool> MarkCourseAsCompletedAsync(UpdateUserCourseProgressesDto dto);
    }
}
