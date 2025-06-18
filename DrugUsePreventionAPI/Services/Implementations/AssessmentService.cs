using DrugUsePreventionAPI.Models.DTOs.AssessmentDto;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.Extensions.Configuration;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class AssessmentService : IAssessmentService
    {
        private readonly IUnitOfWork _unitOfWork; private readonly IConfiguration _configuration;

        public AssessmentService(IUnitOfWork unitOfWork, IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _configuration = configuration;
        }

        public async Task<bool> CreateAssessment(CreateAssessmentDto assessmentDto)
        {
            try
            {
                if (assessmentDto.AssessmentType != "Assist" && assessmentDto.AssessmentType != "Crafft")
                {
                    return false;
                }
                var assessment = new Assessment
                {
                    AssessmentName = assessmentDto.AssessmentName,
                    Description = assessmentDto.Description,
                    AssessmentType = assessmentDto.AssessmentType,
                    MinAge = assessmentDto.MinAge,
                    MaxAge = assessmentDto.MaxAge
                };
                await _unitOfWork.Assessments.AddAsync(assessment);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<bool> UpdateAssessment(int id, CreateAssessmentDto assessmentDto)
        {
            if (assessmentDto.AssessmentType != "Assist" && assessmentDto.AssessmentType != "Crafft")
            {
                return false;
            }
            var assessment = await _unitOfWork.Assessments.GetByIdAsync(id);
            if (assessment == null)
                return false;

            assessment.AssessmentName = assessmentDto.AssessmentName;
            assessment.Description = assessmentDto.Description;
            assessment.AssessmentType = assessmentDto.AssessmentType;
            assessment.MinAge = assessmentDto.MinAge;
            assessment.MaxAge = assessmentDto.MaxAge;

            try
            {
                _unitOfWork.Assessments.Update(assessment);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<List<Assessment>> GetAllAssessment()
        {
            return (await _unitOfWork.Assessments.GetAllAsync()).ToList();
        }

        public async Task<List<Assessment>> GetAssessmentByAge(int age)
        {
            return await _unitOfWork.Assessments.GetAssessmentsByAgeAsync(age);
        }

        public async Task<bool> DeleteAssessment(int id)
        {
            var assessment = await _unitOfWork.Assessments.GetByIdAsync(id);
            if (assessment == null)
            {
                return false;
            }
            try
            {
                _unitOfWork.Assessments.Remove(assessment);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<GetAssessmentDto?> GetAssessmentById(int id)
        {
            var assessment = await _unitOfWork.Assessments.GetAssessmentWithQuestionsAsync(id);
            if (assessment == null)
                return null;

            var dto = new GetAssessmentDto
            {
                AssessmentName = assessment.AssessmentName,
                Questions = assessment.Questions.Select(q => new QuestionDto
                {
                    QuestionId = q.QuestionID,
                    QuestionText = q.QuestionText,
                    Answers = q.AnswerOptions.Select(ans => new AnswerDto
                    {
                        AnswerId = ans.OptionID,
                        OptionText = ans.OptionText,
                        IsCorrect = ans.ScoreValue > 0
                    }).ToList()
                }).ToList()
            };

            return dto;
        }
    }

}