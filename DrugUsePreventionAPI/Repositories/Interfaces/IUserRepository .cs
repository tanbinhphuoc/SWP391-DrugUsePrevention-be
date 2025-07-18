using DrugUsePreventionAPI.Models.DTOs.Consultant;
using DrugUsePreventionAPI.Models.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface IUserRepository : IGenericRepository<User>
    {
        Task<User> GetUserWithRoleAsync(int id);
        Task<User> GetUserByUsernameAsync(string username);
        Task<User> GetUserByEmailAsync(string email);
        Task<bool> UsernameExistsAsync(string username);
        Task<bool> EmailExistsAsync(string email);
        Task<IEnumerable<User>> GetAllWithRolesAsync();
        Task<IEnumerable<User>> GetAllWithMemberAsync();
        Task<User> GetUserByIdWithConsultantAsync(int id);
        Task<IEnumerable<User>> GetUsersByRoleAsync(string roleName);
        Task<IEnumerable<User>> GetUsersByStatusAsync(string status);
        Task<IEnumerable<User>> GetUsersByCreatedDateRangeAsync(DateTime startDate, DateTime endDate);
        Task<IEnumerable<User>> SearchUsersAsync(string searchTerm);
        Task<int> GetUserCountByRoleAsync(string roleName);
        Task<int> GetNewUserCountAsync(DateTime startDate);
        Task<Dictionary<string, int>> GetActiveInactiveRatioAsync();
        Task<User> GetByIdAsync(int id);

        Task<User> GetUserWithProfileAsync(int userId);
        Task<IEnumerable<Course>> GetCoursesByUserIdAsync(int userId);
        Task<IEnumerable<AssessmentResult>> GetAssessmentResultsByUserIdAsync(int userId);
        Task<IEnumerable<Appointment>> GetAppointmentsByUserIdAsync(int userId);
        Task<IEnumerable<ConsultantInfo>> GetConsultantsByUserIdAsync(int userId);
    }
}