using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories
{
    public class CertificateRepository : GenericRepository<Certificate>, ICertificateRepository
    {
        public CertificateRepository(ApplicationDbContext context) : base(context) { }

        public async Task<Certificate> FirstOrDefaultAsync(System.Linq.Expressions.Expression<System.Func<Certificate, bool>> predicate)
        {
            return await _context.Certificates.FirstOrDefaultAsync(predicate);
        }
    }
}