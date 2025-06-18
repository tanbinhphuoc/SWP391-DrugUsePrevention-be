using DrugUsePreventionAPI.Models.Entities;
using System.Collections.Generic;

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
        Task<User> GetUserByIdWithConsultantAsync(int id);  
    }
}
