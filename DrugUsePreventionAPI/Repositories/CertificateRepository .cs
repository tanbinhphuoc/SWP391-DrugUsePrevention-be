using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories
{
    public class CertificateRepository : GenericRepository<Certificate>, ICertificateRepository
    {
        public CertificateRepository(ApplicationDbContext context) : base(context) { }

        public async Task<Certificate> FirstOrDefaultAsync(Expression<Func<Certificate, bool>> predicate, bool asNoTracking = false)
        {
            var query = _context.Certificates.AsQueryable();
            if (asNoTracking)
            {
                query = query.AsNoTracking();
            }
            return await query.FirstOrDefaultAsync(predicate);
        }
    }
}