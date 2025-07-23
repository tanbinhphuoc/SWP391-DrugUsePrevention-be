using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using DrugUsePreventionAPI.Controllers.Data;

namespace DrugUsePreventionAPI.Repositories
{
    public class BlogRepository : IBlogRepository
    {
        private readonly ApplicationDbContext _context;

        public BlogRepository(ApplicationDbContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task<IEnumerable<Blog>> GetAllAsync()
        {
            return await _context.Blogs.AsNoTracking().ToListAsync();
        }

        public async Task<IEnumerable<Blog>> GetActiveBlogsAsync()
        {
            return await _context.Blogs.AsNoTracking().Where(b => b.Status == "Active").ToListAsync();
        }

        public async Task AddAsync(Blog blog)
        {
            if (blog == null)
                throw new ArgumentNullException(nameof(blog));

            await _context.Blogs.AddAsync(blog);
            await _context.SaveChangesAsync();
        }

        public async Task<Blog?> GetByIdAsync(int id)
        {
            return await _context.Blogs.AsNoTracking().FirstOrDefaultAsync(b => b.BlogID == id);
        }

        public async Task<Blog?> GetByIdWithActiveStatusAsync(int id)
        {
            return await _context.Blogs.AsNoTracking().FirstOrDefaultAsync(b => b.BlogID == id && b.Status == "Active");
        }

        public async Task UpdateAsync(Blog blog)
        {
            if (blog == null)
                throw new ArgumentNullException(nameof(blog));

            _context.Blogs.Update(blog);
            await _context.SaveChangesAsync();
        }

        public async Task SoftDeleteAsync(Blog blog)
        {
            if (blog == null)
                throw new ArgumentNullException(nameof(blog));

            blog.Status = "Inactive";
            _context.Blogs.Update(blog);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(Blog blog)
        {
            if (blog == null)
                throw new ArgumentNullException(nameof(blog));

            _context.Blogs.Remove(blog);
            await _context.SaveChangesAsync();
        }
    }
}
