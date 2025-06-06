using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.DTOs.Answer;
using DrugUsePreventionAPI.Models.DTOs.Survey;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class AnswerOptionService : IAnswerOptionService
    {
        private readonly ApplicationDbContext _context;
        private readonly IConfiguration _configuration;

        public AnswerOptionService(ApplicationDbContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }
        public async Task<bool> CreateAnswerOption(CreateAnswerOptionDto createAnswerOptionDto)
        {
            try
            {
                var answerOption = new AnswerOption()
                {
                    QuestionID = createAnswerOptionDto.questionID,
                    OptionText = createAnswerOptionDto.optionText,
                    ScoreValue = createAnswerOptionDto.scoreValue,
                };
                _context.AnswerOptions.Add(answerOption);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public async Task<bool> UpdateAnswerOption(int id, CreateAnswerOptionDto createAnswerOptionDto)
        {
            var answerOption = await _context.AnswerOptions.FindAsync(id);
            if (answerOption == null)
                return false;
            answerOption.QuestionID = createAnswerOptionDto.questionID;
            answerOption.OptionText = createAnswerOptionDto.optionText;
            answerOption.ScoreValue = createAnswerOptionDto.scoreValue;


            try
            {
                _context.AnswerOptions.Update(answerOption);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public async Task<List<AnswerOption>> GetAllAnswerOption()
        {
            return await _context.AnswerOptions.ToListAsync();
        }

        public async Task<AnswerOption?> GetAnswerOptionById(int id)
        {
            return await _context.AnswerOptions.FindAsync(id);
        }

        public async Task<bool> DeleteAnswerOption(int id)
        {
            var answerOption = await _context.AnswerOptions.FindAsync(id);
            if (answerOption == null)
            {
                return false;
            }
            try
            {
                _context.AnswerOptions.Remove(answerOption);
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
