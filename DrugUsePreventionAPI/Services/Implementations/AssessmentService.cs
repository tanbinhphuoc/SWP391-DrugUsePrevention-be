using DrugUsePreventionAPI.Models.DTOs.AssessmentDto;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using DrugUsePreventionAPI.Models.DTOs.Assessment;
using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Exceptions;
using Serilog;

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

            // Không cho trùng tên
            var nameExists = await _unitOfWork.Assessments.FindAsync(a =>
                !a.IsDeleted &&
                a.AssessmentName.ToLower() == dto.AssessmentName.ToLower());

            if (nameExists.Any())
                return (false, $"Tên Assessment '{dto.AssessmentName}' đã tồn tại.", null);

            // Kiểm tra đã tồn tại loại chưa có gắn với khoá học
            var exists = await _unitOfWork.Assessments.FindAsync(a =>
                !a.IsDeleted &&
                a.AssessmentType == dto.AssessmentType &&
                !a.CourseAssessments.Any());

            if (exists.Any())
                return (false, $"Đã tồn tại Assessment đầu vào loại {dto.AssessmentType}.", null);

            var assessment = new Assessment
            {
                AssessmentName = dto.AssessmentName,
                Description = dto.Description,
                AssessmentType = dto.AssessmentType,
                IsDeleted = false
            };

            await _unitOfWork.Assessments.AddAsync(assessment);
            await _unitOfWork.SaveChangesAsync();

            return (true, "Tạo Assessment thành công", assessment.AssessmentID);
        }



        public async Task<(bool IsSuccess, string Message, int? AssessmentId)> CreateOutputAssessment(CreateOutputAssessmentDto dto)
        {
            if (dto.AssessmentType != "Assist" && dto.AssessmentType != "Crafft")
                return (false, "AssessmentType phải là 'Assist' hoặc 'Crafft'.", null);

            if (!dto.CourseID.HasValue)
                return (false, "Phải chọn Course khi tạo Assessment Output.", null);

            var exists = await _context.CourseAssessments
                .Include(ca => ca.Assessment)
                .AnyAsync(ca =>
                    ca.CourseID == dto.CourseID &&
                    !ca.Assessment.IsDeleted &&
                    ca.Assessment.AssessmentType == dto.AssessmentType);

            if (exists)
                return (false, $"Đã tồn tại Assessment Output loại {dto.AssessmentType} cho khóa học này.", null);

            var assessment = new Assessment
            {
                AssessmentName = dto.AssessmentName,
                Description = dto.Description,
                AssessmentType = dto.AssessmentType,
                IsDeleted = false
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

            return (true, "Tạo Assessment Output thành công", assessment.AssessmentID);
        }



        public async Task<bool> UpdateInputAssessmentWithValidation(int id, CreateInputAssessmentDto dto)
        {
            if (dto.AssessmentType != "Assist" && dto.AssessmentType != "Crafft")
                throw new BusinessRuleViolationException("AssessmentType phải là 'Assist' hoặc 'Crafft'.");

            var assessment = await _unitOfWork.Assessments.GetByIdAsync(id);
            if (assessment == null || assessment.IsDeleted)
                throw new EntityNotFoundException("Assessment", id);

            // Lấy danh sách assessment khác có cùng AssessmentType và chưa gắn với khóa học
            var potentialConflicts = await _context.Assessments
                .Include(a => a.CourseAssessments)
                .Where(a =>
                    !a.IsDeleted &&
                    a.AssessmentID != id &&
                    a.AssessmentType == dto.AssessmentType)
                .ToListAsync();

            // Kiểm tra nếu tồn tại bản ghi khác cùng loại và chưa gắn khóa học
            if (potentialConflicts.Any(a => a.CourseAssessments == null || !a.CourseAssessments.Any()))
                throw new BusinessRuleViolationException($"Đã tồn tại Assessment đầu vào loại {dto.AssessmentType}.");

            // Kiểm tra trùng tên
            var nameExists = await _unitOfWork.Assessments.FindAsync(a =>
                !a.IsDeleted &&
                a.AssessmentID != id &&
                a.AssessmentName.ToLower() == dto.AssessmentName.ToLower());

            if (nameExists.Any())
                throw new BusinessRuleViolationException($"Tên Assessment '{dto.AssessmentName}' đã tồn tại.");

            // Cập nhật dữ liệu
            assessment.AssessmentName = dto.AssessmentName;
            assessment.Description = dto.Description;
            assessment.AssessmentType = dto.AssessmentType;

            try
            {
                _unitOfWork.Assessments.Update(assessment);
                await _unitOfWork.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Lỗi khi cập nhật Assessment");
                throw;
            }
        }



        public async Task<(bool IsSuccess, string Message)> UpdateOutputAssessmentWithValidation(int id, CreateOutputAssessmentDto dto)
        {
            if (dto.AssessmentType != "Assist" && dto.AssessmentType != "Crafft")
                return (false, "AssessmentType phải là 'Assist' hoặc 'Crafft'.");

            if (!dto.CourseID.HasValue)
                return (false, "Phải có CourseID khi cập nhật Assessment Output.");

            var assessment = await _unitOfWork.Assessments.GetByIdAsync(id);
            if (assessment == null)
                return (false, "Assessment không tồn tại.");

            var isNameExists = await _unitOfWork.Assessments.FindAsync(a =>
                !a.IsDeleted &&
                a.AssessmentID != id &&
                a.AssessmentName.ToLower() == dto.AssessmentName.ToLower());

            if (isNameExists.Any())
                return (false, "Tên Assessment đã tồn tại.");

            var isTypeExists = await _context.CourseAssessments
                .Include(ca => ca.Assessment)
                .AnyAsync(ca =>
                    ca.CourseID == dto.CourseID &&
                    ca.AssessmentID != id &&
                    !ca.Assessment.IsDeleted &&
                    ca.Assessment.AssessmentType == dto.AssessmentType);

            if (isTypeExists)
                return (false, $"Đã tồn tại Assessment Output loại {dto.AssessmentType} cho khóa học này.");

            // Update fields
            assessment.AssessmentName = dto.AssessmentName;
            assessment.Description = dto.Description;
            assessment.AssessmentType = dto.AssessmentType;

            try
            {
                _unitOfWork.Assessments.Update(assessment);
                await _unitOfWork.SaveChangesAsync();

                var existingLink = await _context.CourseAssessments
                    .FirstOrDefaultAsync(ca => ca.AssessmentID == assessment.AssessmentID);

                if (existingLink != null)
                {
                    existingLink.CourseID = dto.CourseID.Value;
                    _context.CourseAssessments.Update(existingLink);
                }
                else
                {
                    var newLink = new CourseAssessment
                    {
                        AssessmentID = assessment.AssessmentID,
                        CourseID = dto.CourseID.Value
                    };
                    await _context.CourseAssessments.AddAsync(newLink);
                }

                await _context.SaveChangesAsync();
                return (true, "Cập nhật Assessment Output thành công");
            }
            catch
            {
                return (false, "Lỗi khi cập nhật Assessment Output");
            }
        }





        public async Task<List<GetAssessmentListDto>> GetAllAssessmentWithCourse()
        {
            var assessments = await _unitOfWork.Assessments.GetAllActiveAssessmentsAsync();
            var courseAssessments = await _context.CourseAssessments.AsNoTracking().ToListAsync();

            var result = assessments.Select(a =>
            {
                int? courseId = courseAssessments
                    .FirstOrDefault(ca => ca.AssessmentID == a.AssessmentID)?.CourseID;

                return new GetAssessmentListDto
                {
                    AssessmentID = a.AssessmentID,
                    AssessmentName = a.AssessmentName,
                    AssessmentType = a.AssessmentType,
                    Description = a.Description,
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
            if (assessment == null) return false;

            try
            {
                assessment.IsDeleted = true;
                _unitOfWork.Assessments.Update(assessment);

                foreach (var question in assessment.Questions)
                {
                    question.IsDeleted = true;
                    _unitOfWork.Questions.Update(question);

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
            if (assessment == null || assessment.IsDeleted) return null;

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