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

        public async Task<List<CourseVideo>> GetVideosByCourseIdAsync(int courseId)
        {
            return await _context.CourseVideos
                .Where(v => v.CourseID == courseId)
                .OrderBy(v => v.Order)
                .ToListAsync();
        }

        public async Task AddAsync(CourseVideo video)
        {
            await _context.CourseVideos.AddAsync(video);
        }
    }

}
