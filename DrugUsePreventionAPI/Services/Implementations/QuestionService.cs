using DrugUsePreventionAPI.Models.DTOs.Question;
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

        public async Task<bool> UpdateMultipleQuestionsWithAnswers(List<CreateQuestionWithAnswersDto> updatedQuestions)
        {
            if (updatedQuestions == null || !updatedQuestions.Any())
                throw new Exception("Danh sách câu hỏi không được để trống.");

            int assessmentId = updatedQuestions.First().AssessmentID;

            // Lấy các câu hỏi hiện tại để xóa và cập nhật lại
            var existingQuestions = await _unitOfWork.Questions.FindAsync(q =>
                q.AssessmentID == assessmentId && !q.IsDeleted);

            foreach (var q in existingQuestions)
            {
                q.IsDeleted = true;
                _unitOfWork.Questions.Update(q);

                foreach (var a in q.AnswerOptions)
                {
                    a.IsDeleted = true;
                    _unitOfWork.AnswerOptions.Update(a);
                }
            }

            int totalScore = 0;
            var questionTexts = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

            foreach (var questionDto in updatedQuestions)
            {
                // Trùng nội dung câu hỏi
                if (!questionTexts.Add(questionDto.QuestionText.Trim()))
                    throw new Exception("Không được có câu hỏi trùng nhau.");

                if (questionDto.Answers == null || !questionDto.Answers.Any())
                    throw new Exception("Mỗi câu hỏi phải có ít nhất một đáp án.");

                var validScores = questionDto.Answers.Select(a => a.ScoreValue).ToList();

                if (validScores.Any(score => score < 0 || score > 10))
                    throw new Exception("Điểm của mỗi đáp án phải nằm trong khoảng từ 0 đến 10.");

                if (validScores.Count(s => s > 0) != 1)
                    throw new Exception("Mỗi câu hỏi chỉ được phép có duy nhất một đáp án có điểm lớn hơn 0.");

                totalScore += validScores.Max();
            }

            if (totalScore != 10)
                throw new Exception($"Tổng điểm tối đa của toàn bài phải đúng bằng 10. Hiện tại: {totalScore}");

            // Lưu câu hỏi mới
            foreach (var questionDto in updatedQuestions)
            {
                var question = new Question
                {
                    AssessmentID = questionDto.AssessmentID,
                    QuestionText = questionDto.QuestionText,
                    QuestionType = questionDto.QuestionType
                };

                await _unitOfWork.Questions.AddAsync(question);
                await _unitOfWork.SaveChangesAsync(); // để có QuestionID

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