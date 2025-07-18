﻿using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.DTOs.Consultant;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories
{
    public class UserRepository : GenericRepository<User>, IUserRepository
    {
        public UserRepository(ApplicationDbContext context) : base(context) { }

        public async Task<User> GetUserWithRoleAsync(int id)
        {
            return await _context.Users
                .Include(u => u.Role)
                .FirstOrDefaultAsync(u => u.UserID == id);
        }

        public async Task<User> GetUserByUsernameAsync(string username)
        {
            return await _context.Users
                .Include(u => u.Role)
                .FirstOrDefaultAsync(u => u.UserName == username);
        }

        public async Task<User> GetUserByEmailAsync(string email)
        {
            return await _context.Users
                .Include(u => u.Role)
                .FirstOrDefaultAsync(u => u.Email == email);
        }

        public async Task<bool> UsernameExistsAsync(string username)
        {
            return await _context.Users.AnyAsync(u => u.UserName == username);
        }

        public async Task<bool> EmailExistsAsync(string email)
        {
            return await _context.Users.AnyAsync(u => u.Email == email);
        }

        public async Task<IEnumerable<User>> GetAllWithRolesAsync()
        {
            return await _context.Users
                .Include(u => u.Role)
                .ToListAsync();
        }
        public async Task<IEnumerable<User>> GetAllWithMemberAsync()
        {
            return await _context.Users
                .Include(u => u.Role)
               .Where(u => u.Role.RoleName == "Member")
                .ToListAsync();
        }

        public async Task<User> GetUserByIdWithConsultantAsync(int id)
        {
            return await _context.Users
                .Include(u => u.Consultant)
                .FirstOrDefaultAsync(u => u.UserID == id);
        }

        public async Task<IEnumerable<User>> GetUsersByRoleAsync(string roleName)
        {
            return await _context.Users
                .Include(u => u.Role)
                .Where(u => u.Role.RoleName == roleName)
                .ToListAsync();
        }

        public async Task<IEnumerable<User>> GetUsersByStatusAsync(string status)
        {
            return await _context.Users
                .Include(u => u.Role)
                .Where(u => u.Status == status)
                .ToListAsync();
        }

        public async Task<IEnumerable<User>> GetUsersByCreatedDateRangeAsync(DateTime startDate, DateTime endDate)
        {
            return await _context.Users
                .Include(u => u.Role) // Thêm Include
                .Where(u => u.CreatedAt >= startDate && u.CreatedAt <= endDate)
                .ToListAsync();
        }

        public async Task<IEnumerable<User>> SearchUsersAsync(string searchTerm)
        {
            return await _context.Users
                .Include(u => u.Role)
                .Where(u => u.UserName.Contains(searchTerm) || u.Email.Contains(searchTerm) || u.FullName.Contains(searchTerm))
                .ToListAsync();
        }

        public async Task<int> GetUserCountByRoleAsync(string roleName)
        {
            return await _context.Users
                .CountAsync(u => u.Role.RoleName == roleName);
        }

        public async Task<User> GetUserWithProfileAsync(int userId)
        {
            return await _context.Users
                .Include(u => u.Role)
                .Include(u => u.CourseRegistrations)
                .Include(u => u.Appointments)
                .FirstOrDefaultAsync(u => u.UserID == userId);
        }
        public async Task<int> GetNewUserCountAsync(DateTime startDate)
        {
            return await _context.Users
                .CountAsync(u => u.CreatedAt >= startDate);
        }
        public async Task<User> GetByIdAsync(int id)
        {
            return await _context.Users
                .Include(u => u.Role)  
                .FirstOrDefaultAsync(u => u.UserID == id);
        }

        public async Task<IEnumerable<Course>> GetCoursesByUserIdAsync(int userId)
        {
            return await _context.CourseRegistrations
                .Where(cr => cr.UserID == userId)
                .Include(cr => cr.Course)
                .Select(cr => cr.Course)
                .ToListAsync();
        }

        public async Task<IEnumerable<AssessmentResult>> GetAssessmentResultsByUserIdAsync(int userId)
        {
            return await _context.AssessmentResults
                .Where(ar => ar.UserID == userId)
                .Include(ar => ar.Assessment)
                .ToListAsync();
        }

        public async Task<IEnumerable<Appointment>> GetAppointmentsByUserIdAsync(int userId)
        {
            return await _context.Appointments
                .Where(a => a.UserID == userId)
                .Include(a => a.Consultant)
                .ToListAsync();
        }

        public async Task<IEnumerable<ConsultantInfo>> GetConsultantsByUserIdAsync(int userId)
        {
            return await _context.Appointments
                .Where(a => a.UserID == userId && a.Consultant != null)
                .GroupBy(a => a.ConsultantID)
                .Select(g => new ConsultantInfo
                {
                    ConsultantId = g.Key,
                    ConsultantName = g.First().Consultant.User.FullName,
                    ConsultantEmail = g.First().Consultant.User.Email
                })
                .ToListAsync();
        }
        public async Task<Dictionary<string, int>> GetActiveInactiveRatioAsync()
        {
            var activeCount = await _context.Users.CountAsync(u => u.Status == "Active");
            var inactiveCount = await _context.Users.CountAsync(u => u.Status == "Inactive" || u.Status == null);
            var total = activeCount + inactiveCount;
            var ratio = new Dictionary<string, int>
            {
                { "Active", total > 0 ? (int)((double)activeCount / total * 100) : 0 },
                { "Inactive", total > 0 ? (int)((double)inactiveCount / total * 100) : 0 }
            };
            return ratio;
        }
    }
}