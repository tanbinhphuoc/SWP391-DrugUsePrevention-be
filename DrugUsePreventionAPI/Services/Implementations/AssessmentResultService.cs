using DrugUsePreventionAPI.Models.DTOs.AssessmentResultDto;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class AssessmentResultService : IAssessmentResultService
    {
        private readonly IUnitOfWork _unitOfWork;

        public AssessmentResultService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<string> CreateAssessmentResult(CreateAssessmentResultDto dto)
        {
            int score = 0;

            foreach (var item in dto.AnswerOptionId)
            {
                var answer = await _unitOfWork.AnswerOptions.GetByIdAsync(item);
                if (answer == null)
                    throw new Exception("Answer option không tồn tại");

                if (answer.ScoreValue != null)
                {
                    score += (int)answer.ScoreValue;
                }

                // 🔁 Xóa kết quả cũ cùng AssessmentID + User + Stage
                var existingResult = await _unitOfWork.AssessmentResults.FindAsync(
                    r => r.UserID == dto.UserId &&
                         r.AssessmentID == dto.AssessmentId &&
                         r.AssessmentStage == dto.AssessmentStage);

                if (existingResult.Any())
                
                    _unitOfWork.AssessmentResults.RemoveRange(existingResult);
            }

                var newResult = new AssessmentResult
                {
                    AssessmentID = dto.AssessmentId,
                    UserID = dto.UserId,
                    CourseID = dto.CourseId,
                    AssessmentStage = dto.AssessmentStage,
                    Score = score,
                    ResultName = $"Bạn đã hoàn thành bài đánh giá với {score} điểm!",
                    TakeTime = DateTime.Now
                };

                await _unitOfWork.AssessmentResults.AddAsync(newResult);
                await _unitOfWork.SaveChangesAsync();

                return newResult.ResultName;
            
        }

        public async Task<CompareAssessmentResultDto?> CompareAssessmentResults(int userId, int courseId)
        {
            var inputResult = await _unitOfWork.AssessmentResults.GetByUserAndCourseAsync(userId, courseId, "Input");
            var outputResult = await _unitOfWork.AssessmentResults.GetByUserAndCourseAsync(userId, courseId, "Output");

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
                if (outputResult.Score < inputResult.Score)
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
    

        public async Task<bool> IsEligibleForCourseAsync(int userId)
        {
            // Lấy kết quả gần nhất (mọi assessment) để kiểm tra điều kiện
            var latestResult = await _unitOfWork.AssessmentResults.FindAsync(r => r.UserID == userId);
            var result = latestResult.OrderByDescending(r => r.TakeTime).FirstOrDefault();

            return result != null && result.Score < 4;
        }
    }
}
