using System.Runtime.InteropServices;
using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.DTOs.AssessmentDto;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Update.Internal;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class AssessmentService : IAssessmentService
    {
        private readonly ApplicationDbContext _context;
        private readonly IConfiguration _configuration;

        public AssessmentService(ApplicationDbContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }
        public async Task<bool> CreateAssessment(CreateAssessmentDto assessmentDto)
        {
            try
            {
                if (assessmentDto.AssessmentType != "Assist" && assessmentDto.AssessmentType != "Craft")
                {
                    return false;
                }
                var assessment = new Assessment()
                {
                    AssessmentName = assessmentDto.AssessmentName,
                    Description = assessmentDto.Description,
                    AssessmentType = assessmentDto.AssessmentType,
                    MinAge = assessmentDto.MinAge,
                    MaxAge = assessmentDto.MaxAge
                };
                _context.Assessments.Add(assessment);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public async Task <bool> UpdateAssessment(int id, CreateAssessmentDto assessmentDto)
        {
            if (assessmentDto.AssessmentType != "Assist" && assessmentDto.AssessmentType != "Craft")
            {
                return false;
            }
            var assessment = await _context.Assessments.FindAsync(id);
            if (assessment == null)
                return false;

                assessment.AssessmentName = assessmentDto.AssessmentName;
                assessment.Description = assessmentDto.Description;
                assessment.AssessmentType = assessmentDto.AssessmentType;
                assessment.MinAge = assessmentDto.MinAge;
                assessment.MaxAge = assessmentDto.MaxAge;
            try
            {
                _context.Assessments.Update(assessment);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public async Task<List<Assessment>> GetAllAssessment()
        {
            return await _context.Assessments.ToListAsync();
        } 

        public async Task<Assessment?> GetAssessmentById(int id)
        {
            return await _context.Assessments.FindAsync(id);
        }
        public async Task<List<Assessment>> GetAssessmentByAge(int age)
        {
            var assessment = _context.Assessments;
            if (age <= 18)
            {
                return await assessment.Where(a => a.AssessmentType.Equals("Assist")).ToListAsync();
            }
            else
            {
                return await assessment.Where(a => a.AssessmentType.Equals("Crafft")).ToListAsync();
            }
        }

        public async Task<bool> DeleteAssessment(int id)
        {
            var assessment = await _context.Assessments.FindAsync(id);
            if(assessment == null) 
            {
                return false;
            }
            try
            {
                _context.Assessments.Remove(assessment);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

       
    }
}
