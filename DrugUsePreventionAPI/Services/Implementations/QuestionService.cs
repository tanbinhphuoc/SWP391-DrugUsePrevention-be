using DrugUsePreventionAPI.Models.DTOs.Question;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore;
using DrugUsePreventionAPI.Controllers.Data;
using SendGrid.Helpers.Errors.Model;

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

        public async Task UpdateQuestionWithAnswersAsync(UpdateQuestionWithAnswersInputDto inputDto)
        {
            var question = await _context.Questions
                .Include(q => q.AnswerOptions)
                .FirstOrDefaultAsync(q => q.QuestionID == inputDto.QuestionId && !q.IsDeleted);

            if (question == null)
            {
                throw new NotFoundException("Question not found.");
            }

            question.QuestionText = inputDto.QuestionText;
            question.AssessmentID = inputDto.AssessmentId;
            question.QuestionType = inputDto.QuestionType;

            foreach (var answerDto in inputDto.Answers)
            {
                if (answerDto.AnswerId.HasValue)
                {
                    // Update existing answer
                    var existing = question.AnswerOptions.FirstOrDefault(a => a.OptionID == answerDto.AnswerId.Value && !a.IsDeleted);
                    if (existing != null)
                    {
                        existing.OptionText = answerDto.OptionText;
                        existing.ScoreValue = answerDto.ScoreValue;
                    }
                }
                else
                {
                    // Add new answer
                    question.AnswerOptions.Add(new AnswerOption
                    {
                        QuestionID = question.QuestionID,
                        OptionText = answerDto.OptionText,
                        ScoreValue = answerDto.ScoreValue
                    });
                }
            }

            await _context.SaveChangesAsync();
        }

        public async Task UpdateMultipleInputQuestionsWithAnswersAsync(List<UpdateQuestionWithAnswersInputDto> inputDtos)
        {
            if (inputDtos == null || !inputDtos.Any())
                throw new Exception("Danh sách câu hỏi không được để trống");

            int assessmentId = inputDtos.First().AssessmentId;

            // 1. Lấy câu hỏi hiện tại để kiểm tra tổng điểm
            var existingQuestions = await _context.Questions
                .Include(q => q.AnswerOptions)
                .Where(q => q.AssessmentID == assessmentId && !q.IsDeleted)
                .ToListAsync();

            var questionMap = existingQuestions.ToDictionary(q => q.QuestionID, q => q);
            var existingQuestionTexts = existingQuestions
                .Where(q => !inputDtos.Select(i => i.QuestionId).Contains(q.QuestionID)) // loại trừ những câu đang update
                .Select(q => q.QuestionText.Trim().ToLower())
                .ToHashSet();

            // 2. Tính tổng điểm
            int existingMaxScore = 0;

            foreach (var q in existingQuestions)
            {
                if (!inputDtos.Any(dto => dto.QuestionId == q.QuestionID)) // không tính điểm các câu sắp update
                {
                    var answers = q.AnswerOptions.Where(a => !a.IsDeleted);
                    existingMaxScore += answers.Max(a => a.ScoreValue ?? 0);
                }
            }

            int newMaxScore = 0;

            foreach (var dto in inputDtos)
            {
                // Kiểm tra trùng nội dung câu hỏi
                if (existingQuestionTexts.Contains(dto.QuestionText.Trim().ToLower()))
                    throw new Exception($"Câu hỏi '{dto.QuestionText}' đã tồn tại trong bài đánh giá.");

                existingQuestionTexts.Add(dto.QuestionText.Trim().ToLower());

                if (dto.Answers == null || !dto.Answers.Any())
                    throw new Exception("Mỗi câu hỏi phải có ít nhất một đáp án");

                var scoreValues = dto.Answers.Select(a => a.ScoreValue).ToList();

                if (scoreValues.Any(score => score < 0 || score > 10))
                    throw new Exception("Điểm của mỗi đáp án phải nằm trong khoảng từ 0 đến 10");

                if (scoreValues.Count(v => v > 0) > 1)
                    throw new Exception($"Chỉ được phép có 1 đáp án có điểm lớn hơn 0 trong câu hỏi '{dto.QuestionText}'");

                newMaxScore += scoreValues.Max();
            }

            int totalScore = existingMaxScore + newMaxScore;
            if (totalScore != 10)
                throw new Exception($"Tổng điểm tối đa của toàn bài phải đúng bằng 10. Hiện tại: {totalScore}");

            // 3. Tiến hành cập nhật
            foreach (var dto in inputDtos)
            {
                await UpdateQuestionWithAnswersAsync(dto);
            }
        }


        public async Task UpdateQuestionWithAnswersOutputAsync(UpdateQuestionWithAnswersOutputDto dto)
        {
            var question = await _context.Questions
                .Include(q => q.AnswerOptions)
                .FirstOrDefaultAsync(q => q.QuestionID == dto.QuestionId && q.AssessmentID == dto.AssessmentId && !q.IsDeleted);

            if (question == null)
                throw new Exception("Câu hỏi không tồn tại.");

            question.QuestionText = dto.QuestionText;
            question.QuestionType = dto.QuestionType;

            foreach (var answerDto in dto.Answers)
            {
                if (answerDto.AnswerId.HasValue)
                {
                    var existingAnswer = question.AnswerOptions.FirstOrDefault(a => a.OptionID == answerDto.AnswerId.Value && !a.IsDeleted);
                    if (existingAnswer != null)
                    {
                        existingAnswer.OptionText = answerDto.OptionText;
                        existingAnswer.ScoreValue = answerDto.ScoreValue;
                    }
                }
                else
                {
                    question.AnswerOptions.Add(new AnswerOption
                    {
                        OptionText = answerDto.OptionText,
                        ScoreValue = answerDto.ScoreValue,
                        QuestionID = question.QuestionID
                    });
                }
            }

            await _context.SaveChangesAsync();
        }

        public async Task UpdateMultipleOutputQuestionsWithAnswersAsync(List<UpdateQuestionWithAnswersOutputDto> dtos)
        {
            foreach (var dto in dtos)
            {
                await UpdateQuestionWithAnswersOutputAsync(dto);
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
            var existingQuestionTexts = existingQuestions.Select(q => q.QuestionText.Trim().ToLower()).ToHashSet();

            foreach (var q in existingQuestions)
            {
                var answers = await _unitOfWork.AnswerOptions.FindAsync(a =>
                    a.QuestionID == q.QuestionID && !a.IsDeleted);
                existingMaxScore += answers.Max(a => a.ScoreValue ?? 0);
            }

            // 2. Tính tổng điểm tối đa của câu hỏi sắp thêm và kiểm tra ràng buộc
            int newMaxScore = 0;

            foreach (var questionDto in questionsWithAnswers)
            {
                // Kiểm tra trùng nội dung câu hỏi
                if (existingQuestionTexts.Contains(questionDto.QuestionText.Trim().ToLower()))
                    throw new Exception($"Câu hỏi '{questionDto.QuestionText}' đã tồn tại trong bài đánh giá.");

                existingQuestionTexts.Add(questionDto.QuestionText.Trim().ToLower());

                if (questionDto.Answers == null || !questionDto.Answers.Any())
                    throw new Exception("Mỗi câu hỏi phải có ít nhất một đáp án");

                // Kiểm tra điểm hợp lệ
                var scoreValues = questionDto.Answers.Select(a => a.ScoreValue).ToList();
                if (scoreValues.Any(score => score < 0 || score > 10))
                    throw new Exception("Điểm của mỗi đáp án phải nằm trong khoảng từ 0 đến 10");

                // Kiểm tra chỉ có 1 đáp án > 0
                if (scoreValues.Count(v => v > 0) > 1)
                    throw new Exception($"Chỉ được phép có 1 đáp án có điểm lớn hơn 0 trong câu hỏi '{questionDto.QuestionText}'");

                newMaxScore += scoreValues.Max();
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