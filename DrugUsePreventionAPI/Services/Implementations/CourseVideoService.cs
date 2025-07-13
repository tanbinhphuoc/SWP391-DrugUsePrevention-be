using AutoMapper;
using DrugUsePreventionAPI.Exceptions;
using DrugUsePreventionAPI.Models.DTOs.Course;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Services.Interfaces;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class CourseVideoService : ICourseVideoService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public CourseVideoService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<CourseVideo> CreateCourseVideoAsync(CreateCourseVideoDto dto)
        {
            var course = await _unitOfWork.Courses.GetByIdAsync(dto.CourseID);
            if (course == null || course.IsDeleted)
                throw new BusinessRuleViolationException("Khóa học không tồn tại.");

            var video = _mapper.Map<CourseVideo>(dto);
            video.IsDeleted = false;

            await _unitOfWork.CourseVideos.AddAsync(video);
            await _unitOfWork.SaveChangesAsync();

            return video;
        }


        public async Task UpdateCourseVideoAsync(UpdateCourseVideoDto dto)
        {
            var video = await _unitOfWork.CourseVideos.GetByIdAsync(dto.VideoID);
            if (video == null)
                throw new Exception("Không tìm thấy video.");

            video.Title = dto.Title;
            video.VideoUrl = dto.VideoUrl;
            video.Description = dto.Description;

            _unitOfWork.CourseVideos.Update(video);
            await _unitOfWork.SaveChangesAsync();
        }

        public async Task<List<CreateCourseVideoDto>> GetVideosByCourseIdAsync(int courseId)
        {
            var course = await _unitOfWork.Courses.GetByIdAsync(courseId);
            if (course == null || course.IsDeleted)
                throw new BusinessRuleViolationException("Khóa học không tồn tại.");

            var videos = await _unitOfWork.CourseVideos.GetVideosByCourseIdAsync(courseId);
            var filteredVideos = videos.Where(v => !v.IsDeleted).ToList();
            return _mapper.Map<List<CreateCourseVideoDto>>(filteredVideos);
        }

        public async Task<CreateCourseVideoDto> GetVideoByIdAsync(int videoId)
        {
            var video = await _unitOfWork.CourseVideos.GetByIdAsync(videoId);
            if (video == null || video.IsDeleted)
                throw new BusinessRuleViolationException("Video không tồn tại.");

            return _mapper.Map<CreateCourseVideoDto>(video);
        }


        public async Task<bool> DeleteCourseVideoAsync(int videoId)
        {
            var video = await _unitOfWork.CourseVideos.GetByIdAsync(videoId);
            if (video == null || video.IsDeleted)
                return false;

            video.IsDeleted = true;
            await _unitOfWork.SaveChangesAsync();
            return true;
        }


    }

}
