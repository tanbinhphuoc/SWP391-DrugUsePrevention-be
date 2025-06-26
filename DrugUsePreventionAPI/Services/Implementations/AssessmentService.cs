using DrugUsePreventionAPI.Models.DTOs.AssessmentDto;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.Extensions.Configuration;
using DrugUsePreventionAPI.Data;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class AssessmentService : IAssessmentService
    {
        private readonly IUnitOfWork _unitOfWork; 
        private readonly IConfiguration _configuration;
        private readonly ApplicationDbContext _context;

        public AssessmentService(IUnitOfWork unitOfWork, IConfiguration configuration, ApplicationDbContext context)
        {
            _unitOfWork = unitOfWork;
            _configuration = configuration;
            _context = context;
        }

        public async Task<string> CreateAssessment(CreateAssessmentDto assessmentDto)
        {
            // Kiểm tra loại đánh giá
            if (assessmentDto.AssessmentType != "Assist" && assessmentDto.AssessmentType != "Crafft")
                return "AssessmentType chỉ được là 'Assist' hoặc 'Crafft'.";

            // Kiểm tra giai đoạn
            if (assessmentDto.AssessmentStage != "Input" && assessmentDto.AssessmentStage != "Output")
                return "AssessmentStage chỉ được là 'Input' hoặc 'Output'.";

            // Nếu là Output thì cần CourseID
            if (assessmentDto.AssessmentStage == "Output" && !assessmentDto.CourseID.HasValue)
                return "Assessment Output cần có CourseID.";

            // Kiểm tra trùng
            if (assessmentDto.AssessmentStage == "Output" && assessmentDto.CourseID.HasValue)
            {
                var allCourseAssessments = await _context.CourseAssessments
                    .Include(ca => ca.Assessment)
                    .Where(ca => !ca.Assessment.IsDeleted)
                    .ToListAsync();

                var exists = allCourseAssessments.Any(ca =>
                    ca.CourseID == assessmentDto.CourseID.Value &&
                    ca.Assessment.AssessmentStage == "Output" &&
                    ca.Assessment.AssessmentType == assessmentDto.AssessmentType);

                if (exists)
                    return $"Đã tồn tại Assessment Output loại {assessmentDto.AssessmentType} cho khóa học này.";
            }
            else // Nếu là Input
            {
                var existing = await _unitOfWork.Assessments.FindAsync(a =>
                    !a.IsDeleted &&
                    a.AssessmentStage == "Input" &&
                    a.AssessmentType == assessmentDto.AssessmentType);

                if (existing.Any())
                    return $"Đã tồn tại Assessment Input loại {assessmentDto.AssessmentType}.";
            }

            // Tạo mới
            var assessment = new Assessment
            {
                AssessmentName = assessmentDto.AssessmentName,
                Description = assessmentDto.Description,
                AssessmentType = assessmentDto.AssessmentType,
                AssessmentStage = assessmentDto.AssessmentStage,
                MinAge = assessmentDto.MinAge,
                MaxAge = assessmentDto.MaxAge
            };

            await _unitOfWork.Assessments.AddAsync(assessment);
            await _unitOfWork.SaveChangesAsync();

            // Gắn với Course nếu là Output
            if (assessmentDto.AssessmentStage == "Output" && assessmentDto.CourseID.HasValue)
            {
                try
                {
                    var courseAssessment = new CourseAssessment
                    {
                        AssessmentID = assessment.AssessmentID,
                        CourseID = assessmentDto.CourseID.Value
                    };

                    await _context.CourseAssessments.AddAsync(courseAssessment);
                    await _context.SaveChangesAsync();
                }
                catch
                {
                    return "Lỗi khi tạo liên kết CourseAssessment. Có thể CourseID không hợp lệ hoặc đã tồn tại liên kết.";
                }
            }

            return "Tạo Assessment thành công";
        }





        public async Task<bool> UpdateAssessment(int id, CreateAssessmentDto assessmentDto)
        {
            if (assessmentDto.AssessmentType != "Assist" && assessmentDto.AssessmentType != "Crafft")
                return false;

            if (assessmentDto.AssessmentStage != "Input" && assessmentDto.AssessmentStage != "Output")
                return false;

            if (assessmentDto.AssessmentStage == "Output" && !assessmentDto.CourseID.HasValue)
                return false;

            var assessment = await _unitOfWork.Assessments.GetByIdAsync(id);
            if (assessment == null)
                return false;

            assessment.AssessmentName = assessmentDto.AssessmentName;
            assessment.Description = assessmentDto.Description;
            assessment.AssessmentType = assessmentDto.AssessmentType;
            assessment.AssessmentStage = assessmentDto.AssessmentStage;
            assessment.MinAge = assessmentDto.MinAge;
            assessment.MaxAge = assessmentDto.MaxAge;

            try
            {
                _unitOfWork.Assessments.Update(assessment);
                await _unitOfWork.SaveChangesAsync();

                // Xử lý CourseAssessment khi là Output
                if (assessmentDto.AssessmentStage == "Output" && assessmentDto.CourseID.HasValue)
                {
                    var existingLink = _context.CourseAssessments
                        .FirstOrDefault(ca => ca.AssessmentID == assessment.AssessmentID);

                    if (existingLink != null)
                    {
                        existingLink.CourseID = assessmentDto.CourseID.Value;
                        _context.CourseAssessments.Update(existingLink);
                    }
                    else
                    {
                        var newLink = new CourseAssessment
                        {
                            AssessmentID = assessment.AssessmentID,
                            CourseID = assessmentDto.CourseID.Value
                        };
                        await _context.CourseAssessments.AddAsync(newLink);
                    }

                    await _context.SaveChangesAsync();
                }

                return true;
            }
            catch
            {
                return false;
            }
        }


        public async Task<List<Assessment>> GetAllAssessment()
        {
            return await _unitOfWork.Assessments.GetAllActiveAssessmentsAsync();
        }


        public async Task<List<Assessment>> GetAssessmentByAge(int age)
        {
            return await _unitOfWork.Assessments.GetAssessmentsByAgeAsync(age);
        }

        public async Task<bool> DeleteAssessment(int id)
        {
            var assessment = await _unitOfWork.Assessments.GetAssessmentWithQuestionsAsync(id);
            if (assessment == null)
            {
                return false;
            }

            try
            {
                // xóa bài đánh giá
                assessment.IsDeleted = true;
                _unitOfWork.Assessments.Update(assessment);

                // Xóa tất cả các câu hỏi liên quan
                foreach (var question in assessment.Questions)
                {
                    question.IsDeleted = true;
                    _unitOfWork.Questions.Update(question);

                    // Xóa tất cả các AnswerOptions liên quan
                    foreach (var answer in question.AnswerOptions)
                    {
                        answer.IsDeleted = true;
                        _unitOfWork.AnswerOptions.Update(answer);
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



        public async Task<GetAssessmentDto?> GetAssessmentById(int id)
        {
            var assessment = await _unitOfWork.Assessments.GetAssessmentWithQuestionsAsync(id);
            if (assessment == null || assessment.IsDeleted)
                return null;

            var dto = new GetAssessmentDto
            {
                AssessmentName = assessment.AssessmentName,
                Questions = assessment.Questions
                    .Where(q => !q.IsDeleted)
                    .Select(q => new QuestionDto
                    {
                        QuestionId = q.QuestionID,
                        QuestionText = q.QuestionText,
                        Answers = q.AnswerOptions
                            .Where(ans => !ans.IsDeleted)
                            .Select(ans => new AnswerDto
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