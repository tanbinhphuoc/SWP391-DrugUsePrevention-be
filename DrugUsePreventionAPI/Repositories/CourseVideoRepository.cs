using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;


namespace DrugUsePreventionAPI.Repositories
{
    public class CourseVideoRepository : ICourseVideoRepository
    {
        private readonly ApplicationDbContext _context;

        public CourseVideoRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task AddAsync(CourseVideo video)
        {
            await _context.CourseVideos.AddAsync(video);
        }
        public async Task<CourseVideo?> GetByIdAsync(int id)
        {
            return await _context.CourseVideos
                .FirstOrDefaultAsync(v => v.VideoID == id && !v.IsDeleted);
        }

        public async Task<List<CourseVideo>> GetVideosByCourseIdAsync(int courseId)
        {
            return await _context.CourseVideos
                .Where(v => v.CourseID == courseId)
                .ToListAsync();
        }

        public void Update(CourseVideo video)
        {
            _context.CourseVideos.Update(video);
        }

    }

}
