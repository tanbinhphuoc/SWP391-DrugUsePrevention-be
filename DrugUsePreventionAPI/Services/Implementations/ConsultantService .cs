using AutoMapper;
using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class ConsultantService : IConsultantService
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper _mapper;

        public ConsultantService(ApplicationDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }


        public async Task<ConsultantDto> CreateConsultantAsync(CreateConsultantDto createConsultantDto)
        {
            var role = await _context.Roles.FirstOrDefaultAsync(r => r.RoleName == "Consultant");
            if (role == null)
            {
                throw new InvalidOperationException("Consultant role does not exist.");
            }

            var user = new User
            {
                UserName = createConsultantDto.UserName,
                Password = BCrypt.Net.BCrypt.HashPassword(createConsultantDto.Password),
                Email = createConsultantDto.Email,
                FullName = createConsultantDto.FullName,
                RoleID = role.RoleID, // Assign Consultant role
                Status = "Active",
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow
            };

            _context.Users.Add(user);
            await _context.SaveChangesAsync(); // Save the user entity to get the generated userId

            var consultant = new Consultant
            {
                UserID = user.UserID, // Link consultant to the created user
                Degree = createConsultantDto.Degree,
                HourlyRate = createConsultantDto.HourlyRate,
                Specialty = createConsultantDto.Specialty,
                Experience = createConsultantDto.Experience,
                CertificateID = createConsultantDto.CertificateID,
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow
            };

            _context.Consultants.Add(consultant);
            await _context.SaveChangesAsync(); // Save the consultant entity

            // Return the created consultant DTO
            return _mapper.Map<ConsultantDto>(consultant);
        }

        public async Task<ConsultantDto> GetConsultantByIdAsync(int id)
        {
            var consultant = await _context.Consultants
                .Include(c => c.User)
                .Include(c => c.Certificate)
                .FirstOrDefaultAsync(c => c.ConsultantID == id);

            if (consultant == null)
                return null;

            return _mapper.Map<ConsultantDto>(consultant);  
        }

        public async Task<ConsultantDto> UpdateConsultantAsync(int id, UpdateConsultantDto updateConsultantDto)
        {
            var consultant = await _context.Consultants
                .Include(c => c.User)
                .FirstOrDefaultAsync(c => c.ConsultantID == id);
            if (consultant == null)
                return null;

            // Update consultant fields if provided
            if (!string.IsNullOrEmpty(updateConsultantDto.Degree))
                consultant.Degree = updateConsultantDto.Degree;
            if (updateConsultantDto.HourlyRate.HasValue)
                consultant.HourlyRate = updateConsultantDto.HourlyRate.Value;
            if (!string.IsNullOrEmpty(updateConsultantDto.Specialty))
                consultant.Specialty = updateConsultantDto.Specialty;
            if (!string.IsNullOrEmpty(updateConsultantDto.Experience))
                consultant.Experience = updateConsultantDto.Experience;
            if (updateConsultantDto.CertificateID.HasValue)
                consultant.CertificateID = updateConsultantDto.CertificateID.Value;
            consultant.UpdatedAt = DateTime.UtcNow;

            // Update associated user fields if provided
            if (consultant.User != null)
            {
                if (!string.IsNullOrEmpty(updateConsultantDto.UserName))
                    consultant.User.UserName = updateConsultantDto.UserName;
                if (!string.IsNullOrEmpty(updateConsultantDto.Password))
                    consultant.User.Password = BCrypt.Net.BCrypt.HashPassword(updateConsultantDto.Password);
                if (!string.IsNullOrEmpty(updateConsultantDto.Email))
                    consultant.User.Email = updateConsultantDto.Email;
                if (!string.IsNullOrEmpty(updateConsultantDto.FullName))
                    consultant.User.FullName = updateConsultantDto.FullName;
                consultant.User.UpdatedAt = DateTime.UtcNow;
            }

            await _context.SaveChangesAsync();
            return _mapper.Map<ConsultantDto>(consultant);
        }

        public async Task<bool> DeleteConsultantAsync(int id)
        {
            var consultant = await _context.Consultants
                .Include(c => c.User)
                .FirstOrDefaultAsync(c => c.ConsultantID == id);
            if (consultant == null)
                return false;

            // Check for existing appointments
            var hasAppointments = await _context.Appointments
                .AnyAsync(a => a.ConsultantID == id && a.Status == "CONFIRMED");
            if (hasAppointments)
                throw new InvalidOperationException("Cannot delete consultant with confirmed appointments.");

            // Remove associated schedules
            var schedules = await _context.ConsultantSchedules
                .Where(s => s.ConsultantID == id)
                .ToListAsync();
            if (schedules.Any())
                _context.ConsultantSchedules.RemoveRange(schedules);

            // Remove consultant and associated user
            _context.Consultants.Remove(consultant);
            if (consultant.User != null)
                _context.Users.Remove(consultant.User);

            await _context.SaveChangesAsync();
            return true;
        }
    }
}
