using DrugUsePreventionAPI.Models.DTO.UserCourseProgresses;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Repositories.Interfaces;
using DrugUsePreventionAPI.Services.Interfaces;
using System;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class UserCourseProgressesService : IUserCourseProgressesService
    {
        private readonly IUnitOfWork _unitOfWork;

        public UserCourseProgressesService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<bool> MarkCourseAsCompletedAsync(UpdateUserCourseProgressesDto dto)
        {
            var progress = await _unitOfWork.UserCourseProgresses.GetByUserAndCourseAsync(dto.UserID, dto.CourseID);
            if (progress == null)
                return false;

            progress.IsCompleted = true;
            progress.CompletedAt = DateTime.UtcNow;

            await _unitOfWork.SaveChangesAsync();
            return true;
        }
    }
}
