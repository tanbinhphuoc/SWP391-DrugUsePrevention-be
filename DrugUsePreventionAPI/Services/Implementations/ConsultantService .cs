using AutoMapper;
using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class ConsultantService : IConsultantService
    {
        private readonly IUnitOfWork _unitOfWork; private readonly IMapper _mapper;

        public ConsultantService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<ConsultantDto> CreateConsultantAsync(CreateConsultantDto createConsultantDto)
        {
            var role = await _unitOfWork.Roles.GetByNameAsync("Consultant");
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
                RoleID = role.RoleID,
                Status = "Active",
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow
            };

            await _unitOfWork.Users.AddAsync(user);
            await _unitOfWork.SaveChangesAsync();

            var consultant = new Consultant
            {
                UserID = user.UserID,
                Degree = createConsultantDto.Degree,
                HourlyRate = createConsultantDto.HourlyRate,
                Specialty = createConsultantDto.Specialty,
                Experience = createConsultantDto.Experience,
                CertificateID = createConsultantDto.CertificateID,
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow
            };

            await _unitOfWork.Consultants.AddAsync(consultant);
            await _unitOfWork.SaveChangesAsync();

            return _mapper.Map<ConsultantDto>(consultant);
        }

        public async Task<ConsultantDto> GetConsultantByIdAsync(int id)
        {
            var consultant = await _unitOfWork.Consultants.GetConsultantWithUserAndCertificateAsync(id);
            return consultant != null ? _mapper.Map<ConsultantDto>(consultant) : null;
        }

        public async Task<ConsultantDto> UpdateConsultantAsync(int id, UpdateConsultantDto updateConsultantDto)
        {
            var consultant = await _unitOfWork.Consultants.GetConsultantWithUserAndCertificateAsync(id);
            if (consultant == null)
                return null;

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
                _unitOfWork.Users.Update(consultant.User);
            }

            _unitOfWork.Consultants.Update(consultant);
            await _unitOfWork.SaveChangesAsync();
            return _mapper.Map<ConsultantDto>(consultant);
        }

        public async Task<bool> DeleteConsultantAsync(int id)
        {
            var consultant = await _unitOfWork.Consultants.GetConsultantWithUserAndCertificateAsync(id);
            if (consultant == null)
                return false;

            if (await _unitOfWork.Consultants.HasConfirmedAppointmentsAsync(id))
                throw new InvalidOperationException("Cannot delete consultant with confirmed appointments.");

            var schedules = await _unitOfWork.ConsultantSchedules.GetSchedulesByConsultantAsync(id);
            if (schedules.Any())
                _unitOfWork.ConsultantSchedules.RemoveRange(schedules);

            _unitOfWork.Consultants.Remove(consultant);
            if (consultant.User != null)
                _unitOfWork.Users.Remove(consultant.User);

            await _unitOfWork.SaveChangesAsync();
            return true;
        }
    }

}