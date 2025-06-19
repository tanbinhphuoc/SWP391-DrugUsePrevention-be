using DrugUsePreventionAPI.Models.DTOs.Survey;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Exceptions;
using Serilog;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class SurveyService : ISurveyService
    {
        private readonly IUnitOfWork _unitOfWork;

        public SurveyService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<bool> CreateSurvey(CreateSurveyDto createSurveyDto)
        {
            Log.Information("Creating survey with title {Title}", createSurveyDto.title);
            var survey = new Survey
            {
                Title = createSurveyDto.title,
                Type = createSurveyDto.type,
                AuthorID = createSurveyDto.authorID,
                Description = createSurveyDto.description
            };

            await _unitOfWork.Surveys.AddAsync(survey);
            await _unitOfWork.SaveChangesAsync();
            Log.Information("Created survey {Title} with ID {SurveyId}", survey.Title, survey.SurveyID);
            return true;
        }

        public async Task<bool> UpdateSurvey(int id, CreateSurveyDto createSurveyDto)
        {
            Log.Information("Updating survey with ID {SurveyId}", id);
            var survey = await _unitOfWork.Surveys.GetByIdAsync(id);
            if (survey == null)
            {
                Log.Warning("Survey with ID {SurveyId} not found", id);
                throw new EntityNotFoundException("Survey", id);
            }

            survey.Title = createSurveyDto.title;
            survey.Type = createSurveyDto.type;
            survey.AuthorID = createSurveyDto.authorID;
            survey.Description = createSurveyDto.description;

            _unitOfWork.Surveys.Update(survey);
            await _unitOfWork.SaveChangesAsync();
            Log.Information("Updated survey {Title}", survey.Title);
            return true;
        }

        public async Task<List<Survey>> GetAllSurvey()
        {
            Log.Information("Retrieving all surveys");
            var surveys = (await _unitOfWork.Surveys.GetAllAsync()).ToList();
            Log.Information("Retrieved {Count} surveys", surveys.Count);
            return surveys;
        }

        public async Task<Survey?> GetSurveyById(int id)
        {
            Log.Information("Retrieving survey with ID {SurveyId}", id);
            var survey = await _unitOfWork.Surveys.GetByIdAsync(id);
            if (survey == null)
            {
                Log.Warning("Survey with ID {SurveyId} not found", id);
                throw new EntityNotFoundException("Survey", id);
            }
            Log.Information("Retrieved survey {Title}", survey.Title);
            return survey;
        }

        public async Task<bool> DeleteSurvey(int id)
        {
            Log.Information("Deleting survey with ID {SurveyId}", id);
            var survey = await _unitOfWork.Surveys.GetByIdAsync(id);
            if (survey == null)
            {
                Log.Warning("Survey with ID {SurveyId} not found", id);
                return false;
            }

            _unitOfWork.Surveys.Remove(survey);
            await _unitOfWork.SaveChangesAsync();
            Log.Information("Deleted survey {Title}", survey.Title);
            return true;
        }
    }

}