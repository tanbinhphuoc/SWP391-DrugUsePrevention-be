using DrugUsePreventionAPI.Models.DTOs.Survey;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.Extensions.Configuration;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class SurveyService : ISurveyService
    {
        private readonly IUnitOfWork _unitOfWork; private readonly IConfiguration _configuration;

        public SurveyService(IUnitOfWork unitOfWork, IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _configuration = configuration;
        }

        public async Task<bool> CreateSurvey(CreateSurveyDto createSurveyDto)
        {
            try
            {
                var survey = new Survey
                {
                    Title = createSurveyDto.title,
                    Type = createSurveyDto.type,
                    AuthorID = createSurveyDto.authorID,
                    Description = createSurveyDto.description
                };
                await _unitOfWork.Surveys.AddAsync(survey);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<bool> UpdateSurvey(int id, CreateSurveyDto createSurveyDto)
        {
            var survey = await _unitOfWork.Surveys.GetByIdAsync(id);
            if (survey == null)
                return false;

            survey.Title = createSurveyDto.title;
            survey.Type = createSurveyDto.type;
            survey.AuthorID = createSurveyDto.authorID;
            survey.Description = createSurveyDto.description;

            try
            {
                _unitOfWork.Surveys.Update(survey);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<List<Survey>> GetAllSurvey()
        {
            return (await _unitOfWork.Surveys.GetAllAsync()).ToList();
        }

        public async Task<Survey?> GetSurveyById(int id)
        {
            return await _unitOfWork.Surveys.GetByIdAsync(id);
        }

        public async Task<bool> DeleteSurvey(int id)
        {
            var survey = await _unitOfWork.Surveys.GetByIdAsync(id);
            if (survey == null)
            {
                return false;
            }
            try
            {
                _unitOfWork.Surveys.Remove(survey);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }

}