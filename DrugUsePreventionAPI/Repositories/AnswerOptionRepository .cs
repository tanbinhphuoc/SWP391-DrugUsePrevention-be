using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;

namespace DrugUsePreventionAPI.Repositories {
    public class AnswerOptionRepository : GenericRepository<AnswerOption>, IAnswerOptionRepository 
    { public AnswerOptionRepository(ApplicationDbContext context) : base(context) { } 
    } 
}