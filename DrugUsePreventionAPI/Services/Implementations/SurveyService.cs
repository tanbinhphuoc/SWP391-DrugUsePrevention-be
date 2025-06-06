using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.DTOs.AssessmentDto;
using DrugUsePreventionAPI.Models.DTOs.Survey;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class SurveyService : ISurveyService
    {
        private readonly ApplicationDbContext _context;
        private readonly IConfiguration _configuration;

        public SurveyService(ApplicationDbContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }
        public async Task<bool> CreateSurvey(CreateSurveyDto createSurveyDto)
        {
            try
            {
                var survey = new Survey()
                {
                    Title = createSurveyDto.title,
                    Type = createSurveyDto.type,
                    AuthorID = createSurveyDto.authorID,
                    Description = createSurveyDto.description
                };
                _context.Surveys.Add(survey);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public async Task<bool> UpdateSurvey(int id, CreateSurveyDto createSurveyDto)
        {
            var survey = await _context.Surveys.FindAsync(id);
            if (survey == null)
                return false;

                survey.Title = createSurveyDto.title;
                survey.Type = createSurveyDto.type;
                survey.AuthorID = createSurveyDto.authorID;
                survey.Description = createSurveyDto.description;

            try
            {
                _context.Surveys.Update(survey);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public async Task<List<Survey>> GetAllSurvey()
        {
            return await _context.Surveys.ToListAsync();
        }

        public async Task<Survey?> GetSurveyById(int id)
        {
            return await _context.Surveys.FindAsync(id);
        }

        public async Task<bool> DeleteSurvey(int id)
        {
            var survey = await _context.Surveys.FindAsync(id);
            if (survey == null)
            {
                return false;
            }
            try
            {
                _context.Surveys.Remove(survey);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
