﻿using DrugUsePreventionAPI.Models.DTOs.Question;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore;
using DrugUsePreventionAPI.Controllers.Data;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class QuestionService : IQuestionService
    {
        private readonly IUnitOfWork _unitOfWork; 
        private readonly IConfiguration _configuration;
        private readonly ApplicationDbContext _context;

        public QuestionService(IUnitOfWork unitOfWork, IConfiguration configuration, ApplicationDbContext context)
        {
            _unitOfWork = unitOfWork;
            _configuration = configuration;
            _context = context;
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
            return (await _unitOfWork.Questions.FindAsync(q => q.AssessmentID != null && !q.IsDeleted)).ToList();

        }

        public async Task<List<GetQuestionWithAnswersDto>> GetAllQuestionsWithAnswersForAssessmentId(int assessmentId)
        {
            var questions = await _context.Questions
                .Include(q => q.AnswerOptions)
                .Where(q => q.AssessmentID == assessmentId && !q.IsDeleted)
                .ToListAsync();

            var result = questions.Select(q => new GetQuestionWithAnswersDto
            {
                QuestionId = q.QuestionID,
                QuestionText = q.QuestionText,
                QuestionType = q.QuestionType,
                Answers = q.AnswerOptions
                    .Where(a => !a.IsDeleted)
                    .Select(a => new GetQuestionWithAnswersDto.AnswerOptionDto
                    {
                        AnswerId = a.OptionID,
                        OptionText = a.OptionText,
                        ScoreValue = a.ScoreValue ?? 0
                    }).ToList()
            }).ToList();

            return result;
        }



        public async Task<bool> DeleteQuestionForAssessment(int id)
        {
            var questionForAssessment = await _unitOfWork.Questions.GetByIdAsync(id);
            if (questionForAssessment == null || questionForAssessment.AssessmentID == null || questionForAssessment.IsDeleted)
            {
                return false;
            }

            try
            {
                questionForAssessment.IsDeleted = true;
                _unitOfWork.Questions.Update(questionForAssessment);
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
            if (questionsWithAnswers == null || !questionsWithAnswers.Any())
                throw new Exception("Danh sách câu hỏi không được để trống");

            int assessmentId = questionsWithAnswers.First().AssessmentID;

            // 1. Lấy câu hỏi đã có để tính tổng điểm tối đa hiện tại
            var existingQuestions = await _unitOfWork.Questions.FindAsync(q =>
                q.AssessmentID == assessmentId && !q.IsDeleted);

            int existingMaxScore = 0;
            foreach (var q in existingQuestions)
            {
                var answers = await _unitOfWork.AnswerOptions.FindAsync(a =>
                    a.QuestionID == q.QuestionID && !a.IsDeleted);
                existingMaxScore += answers.Max(a => a.ScoreValue ?? 0);
            }

            // 2. Tính tổng điểm tối đa của câu hỏi sắp thêm
            int newMaxScore = 0;

            foreach (var questionDto in questionsWithAnswers)
            {
                if (questionDto.Answers == null || !questionDto.Answers.Any())
                    throw new Exception("Mỗi câu hỏi phải có ít nhất một đáp án");

                // Kiểm tra điểm hợp lệ cho từng đáp án
                if (questionDto.Answers.Any(a => a.ScoreValue < 0 || a.ScoreValue > 10))
                    throw new Exception("Điểm của mỗi đáp án phải nằm trong khoảng từ 0 đến 10");

                newMaxScore += questionDto.Answers.Max(a => a.ScoreValue);
            }

            int totalScore = existingMaxScore + newMaxScore;
            if (totalScore != 10)
                throw new Exception($"Tổng điểm tối đa của toàn bài phải đúng bằng 10. Hiện tại: {totalScore}");

            // 3. Lưu câu hỏi và đáp án vào DB
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

                foreach (var answerDto in questionDto.Answers)
                {
                    var answer = new AnswerOption
                    {
                        QuestionID = question.QuestionID,
                        OptionText = answerDto.OptionText,
                        ScoreValue = answerDto.ScoreValue
                    };

                    await _unitOfWork.AnswerOptions.AddAsync(answer);
                }
            }

            await _unitOfWork.SaveChangesAsync();
            return true;
        }


    }

}