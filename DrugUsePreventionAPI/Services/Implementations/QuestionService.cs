using DrugUsePreventionAPI.Models.DTOs.Question;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.Extensions.Configuration;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class QuestionService : IQuestionService
    {
        private readonly IUnitOfWork _unitOfWork; private readonly IConfiguration _configuration;

        public QuestionService(IUnitOfWork unitOfWork, IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _configuration = configuration;
        }

        public async Task<bool> CreateQuestionForSurvey(CreateQuestionForSurveyDto createQuestionForSurveyDto)
        {
            try
            {
                var questionForSurvey = new Question
                {
                    SurveyID = createQuestionForSurveyDto.surveyID,
                    QuestionText = createQuestionForSurveyDto.questionText,
                    QuestionType = createQuestionForSurveyDto.questionType
                };
                await _unitOfWork.Questions.AddAsync(questionForSurvey);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<bool> UpdateQuestionForSurvey(int id, CreateQuestionForSurveyDto createQuestionForSurveyDto)
        {
            var questionForSurvey = await _unitOfWork.Questions.GetByIdAsync(id);
            if (questionForSurvey == null)
                return false;

            questionForSurvey.SurveyID = createQuestionForSurveyDto.surveyID;
            questionForSurvey.QuestionText = createQuestionForSurveyDto.questionText;
            questionForSurvey.QuestionType = createQuestionForSurveyDto.questionType;

            try
            {
                _unitOfWork.Questions.Update(questionForSurvey);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<List<Question>> GetAllQuestionForSurvey()
        {
            return (await _unitOfWork.Questions.FindAsync(q => q.SurveyID != null)).ToList();
        }

        public async Task<Question?> GetQuestionForSurveyById(int id)
        {
            var question = await _unitOfWork.Questions.GetByIdAsync(id);
            return question?.SurveyID != null ? question : null;
        }

        public async Task<bool> DeleteQuestionForSurvey(int id)
        {
            var questionForSurvey = await _unitOfWork.Questions.GetByIdAsync(id);
            if (questionForSurvey == null || questionForSurvey.SurveyID == null)
            {
                return false;
            }
            try
            {
                _unitOfWork.Questions.Remove(questionForSurvey);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<bool> CreateQuestionForAssessment(CreateQuestionForAssessmentDto createQuestionForAssessmentDto)
        {
            try
            {
                var questionForAssessment = new Question
                {
                    AssessmentID = createQuestionForAssessmentDto.assessmentID,
                    QuestionText = createQuestionForAssessmentDto.questionText,
                    QuestionType = createQuestionForAssessmentDto.questionType
                };
                await _unitOfWork.Questions.AddAsync(questionForAssessment);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<bool> UpdateQuestionForAssessment(int id, CreateQuestionForAssessmentDto createQuestionForAssessmentDto)
        {
            var questionForAssessment = await _unitOfWork.Questions.GetByIdAsync(id);
            if (questionForAssessment == null || questionForAssessment.AssessmentID == null)
                return false;

            questionForAssessment.AssessmentID = createQuestionForAssessmentDto.assessmentID;
            questionForAssessment.QuestionText = createQuestionForAssessmentDto.questionText;
            questionForAssessment.QuestionType = createQuestionForAssessmentDto.questionType;

            try
            {
                _unitOfWork.Questions.Update(questionForAssessment);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<List<Question>> GetAllQuestionForAssessment()
        {
            return (await _unitOfWork.Questions.FindAsync(q => q.AssessmentID != null)).ToList();
        }

        public async Task<Question?> GetQuestionForAssessmentById(int id)
        {
            var question = await _unitOfWork.Questions.GetByIdAsync(id);
            return question?.AssessmentID != null ? question : null;
        }

        public async Task<bool> DeleteQuestionForAssessment(int id)
        {
            var questionForAssessment = await _unitOfWork.Questions.GetByIdAsync(id);
            if (questionForAssessment == null || questionForAssessment.AssessmentID == null)
            {
                return false;
            }
            try
            {
                _unitOfWork.Questions.Remove(questionForAssessment);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public async Task<bool> CreateMultipleQuestionsWithAnswers(List<CreateQuestionWithAnswersDto> questionsWithAnswers)
        {
            try
            {
                foreach (var questionDto in questionsWithAnswers)
                {
                    var question = new Question
                    {
                        AssessmentID = questionDto.AssessmentID,
                        QuestionText = questionDto.QuestionText,
                        QuestionType = questionDto.QuestionType
                    };

                    await _unitOfWork.Questions.AddAsync(question);
                    await _unitOfWork.SaveChangesAsync();

                    foreach (var answer in questionDto.Answers)
                    {
                        var answerOption = new AnswerOption
                        {
                            QuestionID = question.QuestionID,
                            OptionText = answer.OptionText,
                            ScoreValue = answer.ScoreValue
                        };

                        await _unitOfWork.AnswerOptions.AddAsync(answerOption);
                    }
                }

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