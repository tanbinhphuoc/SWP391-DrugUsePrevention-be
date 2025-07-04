using DrugUsePreventionAPI.Models.DTOs.AssessmentDto;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using DrugUsePreventionAPI.Models.DTOs.Assessment;
using DrugUsePreventionAPI.Controllers.Data;

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

        public async Task<(bool IsSuccess, string Message, int? AssessmentId)> CreateInputAssessment(CreateInputAssessmentDto dto)
        {
            if (dto.AssessmentType != "Assist" && dto.AssessmentType != "Crafft")
                return (false, "AssessmentType phải là 'Assist' hoặc 'Crafft'.", null);

            var exists = await _unitOfWork.Assessments.FindAsync(a =>
                !a.IsDeleted &&
                a.AssessmentType == dto.AssessmentType &&
                a.AssessmentStage == "Input");

            if (exists.Any())
                return (false, $"Đã tồn tại Assessment Input loại {dto.AssessmentType}.", null);

            var assessment = new Assessment
            {
                AssessmentName = dto.AssessmentName,
                Description = dto.Description,
                AssessmentType = dto.AssessmentType,
                AssessmentStage = "Input",
                MinAge = dto.MinAge,
                MaxAge = dto.MaxAge
            };

            await _unitOfWork.Assessments.AddAsync(assessment);
            await _unitOfWork.SaveChangesAsync();

            return (true, "Tạo Assessment thành công", assessment.AssessmentID);
        }


        public async Task<(bool IsSuccess, string Message, int? AssessmentId)> CreateOutputAssessment(CreateOutputAssessmentDto dto)
        {
            if (dto.AssessmentType != "Assist" && dto.AssessmentType != "Crafft")
                return (false, "AssessmentType phải là 'Assist' hoặc 'Crafft'.", null);

            var exists = await _context.CourseAssessments
                .Include(ca => ca.Assessment)
                .Where(ca => ca.CourseID == dto.CourseID && !ca.Assessment.IsDeleted &&
                             ca.Assessment.AssessmentStage == "Output" &&
                             ca.Assessment.AssessmentType == dto.AssessmentType)
                .AnyAsync();

            if (exists)
                return (false, $"Đã tồn tại Assessment Output loại {dto.AssessmentType} cho khóa học này.", null);

            var assessment = new Assessment
            {
                AssessmentName = dto.AssessmentName,
                Description = dto.Description,
                AssessmentType = dto.AssessmentType,
                AssessmentStage = "Output",
                MinAge = dto.MinAge,
                MaxAge = dto.MaxAge
            };

            await _unitOfWork.Assessments.AddAsync(assessment);
            await _unitOfWork.SaveChangesAsync();

            var courseAssessment = new CourseAssessment
            {
                AssessmentID = assessment.AssessmentID,
                CourseID = dto.CourseID.Value
            };

            await _context.CourseAssessments.AddAsync(courseAssessment);
            await _context.SaveChangesAsync();

            return (true, "Tạo Assessment thành công", assessment.AssessmentID);
        }






        public async Task<bool> UpdateInputAssessment(int id, CreateInputAssessmentDto assessmentDto)
        {
            var assessment = await _unitOfWork.Assessments.GetByIdAsync(id);
            if (assessment == null || assessment.AssessmentStage != "Input")
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



        public async Task<bool> UpdateOutputAssessment(int id, CreateOutputAssessmentDto assessmentDto)
        {
            if (assessmentDto.AssessmentType != "Assist" && assessmentDto.AssessmentType != "Crafft")
                return false;

            if (assessmentDto.AssessmentStage != "Output" || !assessmentDto.CourseID.HasValue)
                return false;

            var assessment = await _unitOfWork.Assessments.GetByIdAsync(id);
            if (assessment == null || assessment.AssessmentStage != "Output")
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
                return true;
            }
            catch
            {
                return false;
            }
        }



        public async Task<List<GetAssessmentListDto>> GetAllAssessmentWithCourse()
        {
            var assessments = await _unitOfWork.Assessments.GetAllActiveAssessmentsAsync();

            var courseAssessments = await _context.CourseAssessments
                .AsNoTracking()
                .ToListAsync();

            var result = assessments.Select(a =>
            {
                int? courseId = null;
                if (a.AssessmentStage == "Output")
                {
                    courseId = courseAssessments
                        .FirstOrDefault(ca => ca.AssessmentID == a.AssessmentID)?.CourseID;
                }

                return new GetAssessmentListDto
                {
                    AssessmentID = a.AssessmentID,
                    AssessmentName = a.AssessmentName,
                    AssessmentType = a.AssessmentType,
                    AssessmentStage = a.AssessmentStage,
                    Description = a.Description,
                    MinAge = a.MinAge,
                    MaxAge = a.MaxAge,
                    CourseID = courseId
                };
            }).ToList();

            return result;
        }


        public async Task<List<Course>> GetAvailableCourses()
        {
            var allCourses = await _unitOfWork.Courses.GetAllAsync();
            return allCourses.Where(c => !c.IsDeleted).ToList();
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