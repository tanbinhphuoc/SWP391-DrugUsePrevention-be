using DrugUsePreventionAPI.Models.Entities;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface ICertificateRepository : IGenericRepository<Certificate>
    {
        Task<Certificate> FirstOrDefaultAsync(Expression<Func<Certificate, bool>> predicate, bool asNoTracking = false);
    }
}