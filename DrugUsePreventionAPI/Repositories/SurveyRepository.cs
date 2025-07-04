using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;

namespace DrugUsePreventionAPI.Repositories { 
    public class SurveyRepository : GenericRepository<Survey>, ISurveyRepository { 
        public SurveyRepository(ApplicationDbContext context) : base(context) { }
    } 
}