using DrugUsePreventionAPI.Models.Entities;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface ICertificateRepository : IGenericRepository<Certificate>
    {
        Task<Certificate> FirstOrDefaultAsync(System.Linq.Expressions.Expression<System.Func<Certificate, bool>> predicate);
    }
}