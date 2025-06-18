using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;

namespace DrugUsePreventionAPI.Repositories { 
    public class CertificateRepository : GenericRepository<Certificate>, ICertificateRepository 
    { public CertificateRepository(ApplicationDbContext context) : base(context) { } 
    }
}