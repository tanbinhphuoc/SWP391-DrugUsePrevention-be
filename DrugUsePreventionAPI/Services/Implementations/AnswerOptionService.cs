using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.Extensions.Configuration;
using DrugUsePreventionAPI.Models.DTOs.Answer;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class AnswerOptionService : IAnswerOptionService
    {
        private readonly IUnitOfWork _unitOfWork; private readonly IConfiguration _configuration;

        public AnswerOptionService(IUnitOfWork unitOfWork, IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _configuration = configuration;
        }

        public async Task<bool> CreateAnswerOption(CreateAnswerOptionDto createAnswerOptionDto)
        {
            try
            {
                var answerOption = new AnswerOption
                {
                    QuestionID = createAnswerOptionDto.questionID,
                    OptionText = createAnswerOptionDto.optionText,
                    ScoreValue = createAnswerOptionDto.scoreValue
                };
                await _unitOfWork.AnswerOptions.AddAsync(answerOption);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<bool> UpdateAnswerOption(int id, CreateAnswerOptionDto createAnswerOptionDto)
        {
            var answerOption = await _unitOfWork.AnswerOptions.GetByIdAsync(id);
            if (answerOption == null)
                return false;

            answerOption.QuestionID = createAnswerOptionDto.questionID;
            answerOption.OptionText = createAnswerOptionDto.optionText;
            answerOption.ScoreValue = createAnswerOptionDto.scoreValue;

            try
            {
                _unitOfWork.AnswerOptions.Update(answerOption);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<List<AnswerOption>> GetAllAnswerOption()
        {
            var result = await _unitOfWork.AnswerOptions.FindAsync(a => !a.IsDeleted);
            return result.ToList();
        }


        public async Task<AnswerOption?> GetAnswerOptionById(int id)
        {
            var answerOption = await _unitOfWork.AnswerOptions.GetByIdAsync(id);

            if (answerOption == null || answerOption.IsDeleted)
                return null;

            return answerOption;
        }


        public async Task<bool> DeleteAnswerOption(int id)
        {
            var answerOption = await _unitOfWork.AnswerOptions.GetByIdAsync(id);
            if (answerOption == null || answerOption.IsDeleted)
            {
                return false;
            }

            try
            {
                answerOption.IsDeleted = true;
                _unitOfWork.AnswerOptions.Update(answerOption);
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