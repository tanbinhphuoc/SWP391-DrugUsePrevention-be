using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Repositories.Interfaces {
    public interface IRoleRepository : IGenericRepository<Role> {
        Task<Role> GetByNameAsync(string roleName); 
    }
}