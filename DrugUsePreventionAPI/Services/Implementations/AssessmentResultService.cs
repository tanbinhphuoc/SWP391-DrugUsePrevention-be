using DrugUsePreventionAPI.Models.DTOs.AssessmentResultDto;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;

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
            if (dto.AnswerOptionId.Count > 0)
            {
                foreach (var item in dto.AnswerOptionId)
                {
                    var answer = await _unitOfWork.AnswerOptions.GetByIdAsync(item);
                    if (answer == null)
                    {
                        throw new Exception("Answer option khong ton tai");
                    }
                    if (answer.ScoreValue != null)
                    {
                        score += (int)answer.ScoreValue;
                    }
                }
            }
            var assessmentResult = new AssessmentResult
            {
                AssessmentID = dto.AssessmentId,
                UserID = dto.UserId,
                CourseID = dto.CourseId,
                AssessmentStage = dto.AssessmentStage,
                TakeTime = DateTime.Now,
                Score = score,
                ResultName = $"Bạn đã hoàn thành bài đánh gia với {score} điểm!"
            };
            await _unitOfWork.AssessmentResults.AddAsync(assessmentResult);
            await _unitOfWork.SaveChangesAsync();
            return assessmentResult.ResultName;
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