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

            // Tính tổng điểm thực tế từ các câu trả lời người dùng chọn
            foreach (var item in dto.AnswerOptionId)
            {
                var answer = await _unitOfWork.AnswerOptions.GetByIdAsync(item);
                if (answer == null)
                    throw new Exception("Answer option không tồn tại");

                if (answer.ScoreValue.HasValue)
                    score += answer.ScoreValue.Value;
                }

            //  Tính tổng điểm tối đa của toàn bộ bài đánh giá
            var questions = await _unitOfWork.Questions.FindAsync(q =>
                q.AssessmentID == dto.AssessmentId && !q.IsDeleted);

            int maxScore = 0;
            foreach (var question in questions)
            {
                var answers = await _unitOfWork.AnswerOptions.FindAsync(a =>
                    a.QuestionID == question.QuestionID && !a.IsDeleted);
                maxScore += answers.Max(a => a.ScoreValue ?? 0);
            }

            //  Chuyển sang thang điểm 10
            int finalScore = maxScore == 0 ? 0 : (int)Math.Round((double)score / maxScore * 10);

            //  Xóa kết quả cũ của User + Assessment + Stage
            var oldResults = await _unitOfWork.AssessmentResults.FindAsync(r =>
                r.UserID == dto.UserId &&
                r.AssessmentID == dto.AssessmentId &&
                r.AssessmentStage == dto.AssessmentStage);

            if (oldResults.Any())
                _unitOfWork.AssessmentResults.RemoveRange(oldResults);

            //  Nếu là Output mà không có CourseID thì báo lỗi
            if (dto.AssessmentStage == "Output" && dto.CourseId == null)
                throw new Exception("Output Assessment phải có CourseID");

            //  Tạo mới kết quả
            var result = new AssessmentResult
            {
                UserID = dto.UserId,
                AssessmentID = dto.AssessmentId,
                AssessmentStage = dto.AssessmentStage,
                Score = finalScore,
                TakeTime = DateTime.Now,
                ResultName = $"Bạn đã hoàn thành bài đánh giá với {finalScore} điểm!",
                CourseID = dto.AssessmentStage == "Output" ? dto.CourseId : null
            };

            await _unitOfWork.AssessmentResults.AddAsync(result);
            await _unitOfWork.SaveChangesAsync();

            return result.ResultName;
        }



        public async Task<CompareAssessmentResultDto?> CompareAssessmentResults(int userId, int courseId)
        {
            // Bài Input: chỉ cần UserID + Stage là "Input", không cần CourseID
            var inputResult = (await _unitOfWork.AssessmentResults.FindAsync(r =>
                r.UserID == userId && r.AssessmentStage == "Input"))
                .OrderByDescending(r => r.TakeTime)
                .FirstOrDefault();

            // Bài Output: cần đúng cả UserID + Stage = "Output" + CourseID
            var outputResult = (await _unitOfWork.AssessmentResults.FindAsync(r =>
                r.UserID == userId && r.AssessmentStage == "Output" && r.CourseID == courseId))
                .OrderByDescending(r => r.TakeTime)
                .FirstOrDefault();

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
