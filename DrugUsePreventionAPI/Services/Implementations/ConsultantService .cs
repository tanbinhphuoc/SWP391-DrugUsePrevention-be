using AutoMapper;
using DrugUsePreventionAPI.Exceptions;
using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Services.Interfaces;
using Serilog;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class ConsultantService : IConsultantService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public ConsultantService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork ?? throw new ArgumentNullException(nameof(unitOfWork));
            _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
        }

        public async Task<ConsultantDto> CreateConsultantAsync(CreateConsultantDto createConsultantDto)
        {
            Log.Information("Creating consultant with user {UserName}", createConsultantDto.UserName);

            if (await _unitOfWork.Users.UsernameExistsAsync(createConsultantDto.UserName))
            {
                Log.Warning("Username {UserName} already exists", createConsultantDto.UserName);
                throw new DuplicateEntityException("User", "Username", createConsultantDto.UserName);
            }
            if (await _unitOfWork.Users.EmailExistsAsync(createConsultantDto.Email))
            {
                Log.Warning("Email {Email} already exists", createConsultantDto.Email);
                throw new DuplicateEntityException("User", "Email", createConsultantDto.Email);
            }

            var user = _mapper.Map<User>(createConsultantDto);
            user.Password = BCrypt.Net.BCrypt.HashPassword(createConsultantDto.Password);
            user.RoleID = (await _unitOfWork.Roles.GetByNameAsync("Consultant"))?.RoleID ?? throw new EntityNotFoundException("Role", "Consultant");
            user.Status = "Active";
            user.CreatedAt = DateTime.UtcNow;
            user.UpdatedAt = DateTime.UtcNow;

            await _unitOfWork.Users.AddAsync(user);
            await _unitOfWork.SaveChangesAsync();

            var consultant = new Consultant
            {
                UserID = user.UserID,
                CertificateID = createConsultantDto.CertificateID,
                Specialty = createConsultantDto.Specialty,
                Degree = createConsultantDto.Degree,
                Experience = createConsultantDto.Experience,
                HourlyRate = createConsultantDto.HourlyRate,
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow
            };

            await _unitOfWork.Consultants.AddAsync(consultant);
            await _unitOfWork.SaveChangesAsync();

            var result = _mapper.Map<ConsultantDto>(consultant);
            Log.Information("Created consultant {ConsultantId} with user {UserName}", result.ConsultantID, user.UserName);
            return result;
        }

        public async Task<ConsultantDto> GetConsultantByIdAsync(int id)
        {
            Log.Information("Retrieving consultant with ID {ConsultantId}", id);
            var consultant = await _unitOfWork.Consultants.GetConsultantWithUserAndCertificateAsync(id);
            if (consultant == null)
            {
                Log.Warning("Consultant with ID {ConsultantId} not found", id);
                throw new EntityNotFoundException("Consultant", id);
            }
            var result = _mapper.Map<ConsultantDto>(consultant);
            Log.Information("Retrieved consultant {ConsultantId}", result.ConsultantID);
            return result;
        }

        public async Task<ConsultantDto> UpdateConsultantAsync(int id, UpdateConsultantDto updateConsultantDto)
        {
            Log.Information("Updating consultant with ID {ConsultantId}", id);
            var consultant = await _unitOfWork.Consultants.GetConsultantWithUserAndCertificateAsync(id);
            if (consultant == null)
            {
                Log.Warning("Consultant with ID {ConsultantId} not found", id);
                throw new EntityNotFoundException("Consultant", id);
            }

            _mapper.Map(updateConsultantDto, consultant);
            consultant.UpdatedAt = DateTime.UtcNow;

            _unitOfWork.Consultants.Update(consultant);
            await _unitOfWork.SaveChangesAsync();

            var result = _mapper.Map<ConsultantDto>(consultant);
            Log.Information("Updated consultant {ConsultantId}", result.ConsultantID);
            return result;
        }

        public async Task<bool> DeleteConsultantAsync(int id)
        {
            Log.Information("Deleting consultant with ID {ConsultantId}", id);
            var consultant = await _unitOfWork.Consultants.GetConsultantWithUserAndCertificateAsync(id);
            if (consultant == null)
            {
                Log.Warning("Consultant with ID {ConsultantId} not found", id);
                return false;
            }

            if (await _unitOfWork.Consultants.HasConfirmedAppointmentsAsync(id))
            {
                Log.Warning("Cannot delete consultant {ConsultantId} with confirmed appointments", id);
                throw new BusinessRuleViolationException("Cannot delete consultant with confirmed appointments.");
            }

            _unitOfWork.Consultants.Remove(consultant);
            await _unitOfWork.SaveChangesAsync();
            Log.Information("Deleted consultant with ID {ConsultantId}", id);
            return true;
        }

        // Trong ConsultantService.cs
        public async Task<ConsultantDto> UpdateConsultantProfileAsync(int userId, UpdateConsultantDto updateConsultantDto, bool isAdmin = false)
        {
            Log.Information("Updating consultant profile for UserID={UserId} by {Role}", userId, isAdmin ? "Admin" : "Consultant");

            var consultant = await _unitOfWork.Consultants.GetByUserIdAsync(userId);
            if (consultant == null)
            {
                Log.Warning("Consultant with UserID {UserId} not found", userId);
                throw new EntityNotFoundException("Consultant", userId);
            }

            var user = await _unitOfWork.Users.GetByIdAsync(userId);
            if (user == null)
            {
                Log.Warning("User with UserID {UserId} not found", userId);
                throw new EntityNotFoundException("User", userId);
            }

            if (!isAdmin && user.UserID != userId)
            {
                Log.Warning("Unauthorized access to update consultant profile for UserID={UserId}", userId);
                throw new UnauthorizedAccessException("You can only update your own profile.");
            }

            if (updateConsultantDto.UserName != null && await _unitOfWork.Users.UsernameExistsAsync(updateConsultantDto.UserName) && updateConsultantDto.UserName != user.UserName)
            {
                Log.Warning("Username {UserName} already exists", updateConsultantDto.UserName);
                throw new DuplicateEntityException("User", "Username", updateConsultantDto.UserName);
            }

            if (updateConsultantDto.Email != null && await _unitOfWork.Users.EmailExistsAsync(updateConsultantDto.Email) && updateConsultantDto.Email != user.Email)
            {
                Log.Warning("Email {Email} already exists", updateConsultantDto.Email);
                throw new DuplicateEntityException("User", "Email", updateConsultantDto.Email);
            }

            _mapper.Map(updateConsultantDto, user);
            _mapper.Map(updateConsultantDto, consultant);
            if (!string.IsNullOrEmpty(updateConsultantDto.Password))
            {
                user.Password = BCrypt.Net.BCrypt.HashPassword(updateConsultantDto.Password);
            }
            user.UpdatedAt = DateTime.UtcNow;
            consultant.UpdatedAt = DateTime.UtcNow;

            _unitOfWork.Users.Update(user);
            _unitOfWork.Consultants.Update(consultant);
            await _unitOfWork.SaveChangesAsync();

            var result = _mapper.Map<ConsultantDto>(consultant);
            Log.Information("Updated consultant profile for UserID={UserId} by {Role}", userId, isAdmin ? "Admin" : "Consultant");
            return result;
        }
    }
}