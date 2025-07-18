﻿using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Repositories
{
    public class CourseRepository : GenericRepository<Course>, ICourseRepository
    {
        public CourseRepository(ApplicationDbContext context) : base(context) { }

        // Trả về tất cả Course, kể cả đã bị xóa
        public async Task<List<Course>> GetAllCourses()
        {
            return await _context.Courses.ToListAsync();
        }
        // Trả về Course chưa bị xóa mềm
        public async Task<Course?> GetCourseByTypeAsync(string type)
        {
            return await _context.Courses
                .Where(c => !c.IsDeleted && c.Type.ToLower().Trim() == type.ToLower().Trim())
                .FirstOrDefaultAsync();
        }

        //chỉ lấy các Course chưa bị xóa
        public async Task<List<Course>> GetAllActiveCourses()
        {
            return await _context.Courses
                .Where(c => !c.IsDeleted)
                .ToListAsync();
        }

        public async Task<List<Course>> GetCompletedCoursesByUser(int userId)
        {
            var completedCourseIds = await _context.UserCourseProgresses
                .Where(p => p.UserID == userId && p.IsCompleted) 
                .Select(p => p.CourseID)
                .ToListAsync();

            return await _context.Courses
                .Where(c => completedCourseIds.Contains(c.CourseID) && !c.IsDeleted) 
                .ToListAsync();
        }

    }

}