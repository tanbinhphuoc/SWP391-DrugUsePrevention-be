using DrugUsePreventionAPI.Models.DTOs.CourseVideo;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class CourseVideoService : ICourseVideoService
    {
        private readonly IUnitOfWork _unitOfWork;

        public CourseVideoService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task AddCourseVideoAsync(CreateCourseVideoDto dto)
        {
            var video = new CourseVideo
            {
                CourseID = dto.CourseID,
                Title = dto.Title,
                VideoUrl = dto.VideoUrl,
                DurationInSeconds = dto.DurationInSeconds
            };

            await _unitOfWork.CourseVideos.AddAsync(video);
            await _unitOfWork.SaveChangesAsync();
        }

        public async Task<List<CourseVideo>> GetVideosByCourseIdAsync(int courseId)
        {
            var videos = await _unitOfWork.CourseVideos
                .FindAsync(v => v.CourseID == courseId);

            return videos.ToList();
        }


        public async Task SetUserVideoProgressAsync(UserVideoProgressDto dto)
        {
            var progress = await _unitOfWork.UserVideoProgresses
                .FindAsync(p => p.UserID == dto.UserID && p.VideoID == dto.VideoID);

            var existing = progress.FirstOrDefault();

            if (existing != null)
            {
                existing.IsWatched = dto.IsWatched;
                existing.WatchedAt = dto.IsWatched ? DateTime.UtcNow : null;
                _unitOfWork.UserVideoProgresses.Update(existing);
            }
            else
            {
                await _unitOfWork.UserVideoProgresses.AddAsync(new UserVideoProgress
                {
                    UserID = dto.UserID,
                    VideoID = dto.VideoID,
                    IsWatched = dto.IsWatched,
                    WatchedAt = dto.IsWatched ? DateTime.UtcNow : null
                });
            }
            await _unitOfWork.SaveChangesAsync();
        }

        public async Task<bool> HasUserCompletedCourse(int userId, int courseId)
        {
            var videos = await _unitOfWork.CourseVideos.FindAsync(v => v.CourseID == courseId);
            if (!videos.Any()) return false;

            foreach (var video in videos)
            {
                var progress = await _unitOfWork.UserVideoProgresses.FindAsync(p => p.UserID == userId && p.VideoID == video.VideoID);
                if (!progress.Any() || !progress.First().IsWatched)
                    return false;
            }
            return true;
        }
    }
}
