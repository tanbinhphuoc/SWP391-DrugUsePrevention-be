using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.DTOs.AssessmentResultDto;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class AssessmentResultService : IAssessmentResultService
    {
        private readonly ApplicationDbContext _context;

        public AssessmentResultService(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<string> CreateAssessmentResult(CreateAssessmentResultDto dto)
        {
            int score = 0;
            if(dto.AnswerOptionId.Count > 0)
            {
                foreach (var item in dto.AnswerOptionId)
                {
                    AnswerOption? answer = await _context.AnswerOptions.FindAsync(item);
                    if (answer == null)
                    {
                        throw new Exception("Answer option khong ton tai");
                    }
                    if(answer.ScoreValue != null)
                    {
                        score += (int)answer.ScoreValue;
                    }
                }
            }
            AssessmentResult assessmentResult = new()
            {
                AssessmentID = dto.AssessmentId,
                UserID = dto.UserId,
                CourseID = dto.CourseId,
                AssessmentStage = dto.AssessmentStage,
                TakeTime = DateTime.Now,
                Score = score,
                ResultName = $"Bạn đã hoàn thành bài đánh gia với {score} điểm!"
            };
            _context.AssessmentResults.Add(assessmentResult);
            _context.SaveChanges();
            return assessmentResult.ResultName;
        }

        public async Task<CompareAssessmentResultDto?> CompareAssessmentResults(int userId, int courseId)
        {
            var inputResult = await _context.AssessmentResults
                .FirstOrDefaultAsync(x => x.UserID == userId && x.CourseID == courseId && x.AssessmentStage == "Input");

            var outputResult = await _context.AssessmentResults
                .FirstOrDefaultAsync(x => x.UserID == userId && x.CourseID == courseId && x.AssessmentStage == "Output");

            if (inputResult == null && outputResult == null)
                return null;

            var comparison = new CompareAssessmentResultDto
            {
                UserID = userId,
                CourseID = courseId,
                InputScore = inputResult?.Score,
                OutputScore = outputResult?.Score
            };

            if (inputResult != null && outputResult != null)
            {
                if (outputResult.Score > inputResult.Score)
                    comparison.ComparisonResult = "Kết quả cải thiện sau khóa học.";
                else if (outputResult.Score == inputResult.Score)
                    comparison.ComparisonResult = "Không có sự thay đổi.";
                else
                    comparison.ComparisonResult = "Kết quả kém hơn sau khóa học.";
            }
            else if (inputResult == null)
                comparison.ComparisonResult = "Chưa có bài đánh giá đầu vào.";
            else if (outputResult == null)
                comparison.ComparisonResult = "Chưa có bài đánh giá đầu ra.";

            return comparison;
        }

    }
}
