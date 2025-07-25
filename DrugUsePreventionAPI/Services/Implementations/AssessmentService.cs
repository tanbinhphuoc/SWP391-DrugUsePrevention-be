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

            // Không cho phép cùng CourseID đã có Assessment Output (bất kể loại)
            var exists = await _context.CourseAssessments
                .Include(ca => ca.Assessment)
                .AnyAsync(ca =>
                    ca.CourseID == dto.CourseID &&
                    !ca.Assessment.IsDeleted);

            if (exists)
                return (false, $"Khóa học này đã có Assessment Output.", null);

            var assessment = new Assessment
            {
                AssessmentName = dto.AssessmentName,
                Description = dto.Description,
                AssessmentType = dto.AssessmentType,
                IsDeleted = false,
                AssessmentStage = "Output"
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

            var newName = dto.AssessmentName.Trim().ToLower();
            var oldName = assessment.AssessmentName.Trim().ToLower();

            // Chỉ kiểm tra trùng tên nếu tên mới khác tên cũ
            if (newName != oldName)
            {
                var nameConflict = await _unitOfWork.Assessments.FindAsync(a =>
                    !a.IsDeleted &&
                    a.AssessmentID != id &&
                    a.AssessmentName.Trim().ToLower() == newName);

                if (nameConflict.Any())
                    throw new BusinessRuleViolationException("Đã tồn tại Assessment khác có cùng tên.");
            }

            // Kiểm tra nếu có assessment khác cùng loại và chưa gắn với khóa học
            var potentialConflicts = await _context.Assessments
                .Include(a => a.CourseAssessments)
                .Where(a =>
                    !a.IsDeleted &&
                    a.AssessmentID != id &&
                    a.AssessmentType == dto.AssessmentType)
                .ToListAsync();

            if (potentialConflicts.Any(a => a.CourseAssessments == null || !a.CourseAssessments.Any()))
                throw new BusinessRuleViolationException($"Đã tồn tại Assessment đầu vào loại {dto.AssessmentType}.");

            // Cập nhật
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
            if (assessment == null || assessment.IsDeleted)
                return (false, "Assessment không tồn tại.");

            // Nếu tên thay đổi thì kiểm tra trùng tên
            var newName = dto.AssessmentName.Trim().ToLower();
            var oldName = assessment.AssessmentName.Trim().ToLower();

            if (newName != oldName)
            {
                var isNameExists = await _unitOfWork.Assessments.FindAsync(a =>
                    !a.IsDeleted &&
                    a.AssessmentID != id &&
                    a.AssessmentName.Trim().ToLower() == newName);

                if (isNameExists.Any())
                    return (false, "Đã tồn tại Assessment khác có cùng tên.");
            }

            // Kiểm tra đã tồn tại assessment khác cùng loại và cùng CourseID
            var isTypeExists = await _context.CourseAssessments
                .Include(ca => ca.Assessment)
                .AnyAsync(ca =>
                    ca.CourseID == dto.CourseID &&
                    ca.AssessmentID != id &&
                    !ca.Assessment.IsDeleted &&
                    ca.Assessment.AssessmentType == dto.AssessmentType);

            if (isTypeExists)
                return (false, $"Đã tồn tại Assessment Output loại {dto.AssessmentType} cho khóa học này.");

            // Cập nhật thông tin assessment
            assessment.AssessmentName = dto.AssessmentName;
            assessment.Description = dto.Description;
            assessment.AssessmentType = dto.AssessmentType;

            try
            {
                _unitOfWork.Assessments.Update(assessment);
                await _unitOfWork.SaveChangesAsync();

                // Cập nhật liên kết CourseAssessment
                var existingLink = await _context.CourseAssessments
                    .FirstOrDefaultAsync(ca => ca.AssessmentID == id);

                if (existingLink != null)
                {
                    // Nếu CourseID thay đổi thì cập nhật
                    if (existingLink.CourseID != dto.CourseID.Value)
                    {
                        // Kiểm tra lại trước khi cập nhật (an toàn)
                        var conflict = await _context.CourseAssessments
                            .Include(ca => ca.Assessment)
                            .AnyAsync(ca =>
                                ca.CourseID == dto.CourseID &&
                                ca.AssessmentID != id &&
                                !ca.Assessment.IsDeleted &&
                                ca.Assessment.AssessmentType == dto.AssessmentType);

                        if (conflict)
                            return (false, $"Khóa học đã có Assessment Output loại {dto.AssessmentType} khác.");

                        existingLink.CourseID = dto.CourseID.Value;
                        _context.CourseAssessments.Update(existingLink);
                    }
                }
                else
                {
                    // Nếu chưa có liên kết thì tạo mới
                    var newLink = new CourseAssessment
                    {
                        AssessmentID = id,
                        CourseID = dto.CourseID.Value
                    };
                    await _context.CourseAssessments.AddAsync(newLink);
                }

                await _context.SaveChangesAsync();
                return (true, "Cập nhật Assessment Output thành công");
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Lỗi khi cập nhật Assessment Output");
                return (false, "Lỗi khi cập nhật Assessment Output");
            }
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

        public async Task<List<GetAssessmentInputDto>> GetAllAssessmentInput()
        {
            var assessments = await _unitOfWork.Assessments.FindAsync(a =>
                !a.IsDeleted &&
                !_context.CourseAssessments.Any(ca => ca.AssessmentID == a.AssessmentID));

            return assessments.Select(a => new GetAssessmentInputDto
            {
                AssessmentID = a.AssessmentID,
                AssessmentName = a.AssessmentName,
                AssessmentType = a.AssessmentType,
                Description = a.Description
            }).ToList();
        }

        public async Task<List<GetAssessmentOutputDto>> GetAllAssessmentOutput()
        {
            var courseAssessments = await _context.CourseAssessments
                .Include(ca => ca.Assessment)
                .Where(ca => !ca.Assessment.IsDeleted)
                .ToListAsync();

            return courseAssessments.Select(ca => new GetAssessmentOutputDto
            {
                AssessmentID = ca.Assessment.AssessmentID,
                AssessmentName = ca.Assessment.AssessmentName,
                AssessmentType = ca.Assessment.AssessmentType,
                Description = ca.Assessment.Description,
                CourseID = ca.CourseID
            }).ToList();
        }
        public async Task<GetAssessmentInputDto?> GetInputAssessmentById(int id)
        {
            var assessment = await _unitOfWork.Assessments.GetByIdAsync(id);
            if (assessment == null || assessment.IsDeleted)
                return null;

            // Đảm bảo là đầu vào (không liên kết với khóa học nào)
            bool isInput = !await _context.CourseAssessments.AnyAsync(ca => ca.AssessmentID == id);
            if (!isInput) return null;

            return new GetAssessmentInputDto
            {
                AssessmentID = assessment.AssessmentID,
                AssessmentName = assessment.AssessmentName,
                Description = assessment.Description,
                AssessmentType = assessment.AssessmentType
            };
        }
        public async Task<GetAssessmentOutputDto?> GetOutputAssessmentById(int id)
        {
            var assessment = await _unitOfWork.Assessments.GetByIdAsync(id);
            if (assessment == null || assessment.IsDeleted)
                return null;

            // Tìm liên kết với Course
            var courseAssessment = await _context.CourseAssessments
                .FirstOrDefaultAsync(ca => ca.AssessmentID == id);

            if (courseAssessment == null)
                return null;

            return new GetAssessmentOutputDto
            {
                AssessmentID = assessment.AssessmentID,
                AssessmentName = assessment.AssessmentName,
                Description = assessment.Description,
                AssessmentType = assessment.AssessmentType,
                CourseID = courseAssessment.CourseID
            };
        }



    }

}