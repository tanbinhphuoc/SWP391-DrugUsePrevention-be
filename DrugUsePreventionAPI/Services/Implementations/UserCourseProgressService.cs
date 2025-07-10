using DrugUsePreventionAPI.Models.DTO.UserCourseProgress;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Repositories.Interfaces;
using DrugUsePreventionAPI.Services.Interfaces;
using System;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class UserCourseProgressService : IUserCourseProgressService
    {
        private readonly IUnitOfWork _unitOfWork;

        public UserCourseProgressService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<bool> MarkCourseAsCompletedAsync(UpdateUserCourseProgressDto dto)
        {
            var progress = await _unitOfWork.UserCourseProgress.GetByUserAndCourseAsync(dto.UserID, dto.CourseID);
            if (progress == null)
                return false;

            progress.IsCompleted = true;
            progress.CompletedAt = DateTime.UtcNow;

            await _unitOfWork.SaveChangesAsync();
            return true;
        }
    }
}
