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

        public async Task AddCourseVideoAsync(CreateCourseVideoDto dto)
        {
            var course = await _unitOfWork.Courses.GetByIdAsync(dto.CourseID);
            if (course == null || course.IsDeleted)
                throw new BusinessRuleViolationException("Khóa học không tồn tại.");

            var video = _mapper.Map<CourseVideo>(dto);
            await _unitOfWork.CourseVideos.AddAsync(video);
            await _unitOfWork.SaveChangesAsync();
        }

        public async Task<List<CourseVideoDto>> GetVideosByCourseIdAsync(int courseId)
        {
            var videos = await _unitOfWork.CourseVideos.GetVideosByCourseIdAsync(courseId);
            return _mapper.Map<List<CourseVideoDto>>(videos);
        }
    }

}
