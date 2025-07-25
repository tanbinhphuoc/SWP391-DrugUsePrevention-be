using AutoMapper;
using DrugUsePreventionAPI.Exceptions;
using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.EntityFrameworkCore;
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

            // Validate username and email
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

            // Handle certificate
            Certificate certificate = await _unitOfWork.Certificates
                .FirstOrDefaultAsync(c => c.CertificateName == createConsultantDto.CertificateName);
            if (certificate == null)
            {
                certificate = new Certificate
                {
                    CertificateName = createConsultantDto.CertificateName,
                    DateAcquired = createConsultantDto.DateAcquired ?? DateTime.UtcNow
                };
                await _unitOfWork.Certificates.AddAsync(certificate);
                await _unitOfWork.SaveChangesAsync();
            }
            else if (createConsultantDto.DateAcquired.HasValue)
            {
                certificate.DateAcquired = createConsultantDto.DateAcquired.Value;
                _unitOfWork.Certificates.Update(certificate);
                await _unitOfWork.SaveChangesAsync();
            }

            // Create user
            var user = _mapper.Map<User>(createConsultantDto);
            user.Password = BCrypt.Net.BCrypt.HashPassword(createConsultantDto.Password);
            user.RoleID = (await _unitOfWork.Roles.GetByNameAsync("Consultant"))?.RoleID
                ?? throw new EntityNotFoundException("Role", "Consultant");
            user.Status = "Active";
            user.CreatedAt = DateTime.UtcNow;
            user.UpdatedAt = DateTime.UtcNow;

            await _unitOfWork.Users.AddAsync(user);
            await _unitOfWork.SaveChangesAsync();

            // Create consultant
            var consultant = new Consultant
            {
                UserID = user.UserID,
                CertificateID = certificate.CertificateID,
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

        public async Task<ConsultantDto> UpdateConsultantAsync(int id, AdminUpdateConsultantDto updateConsultantDto)
        {
            Serilog.Log.Information("Admin updating consultant with ID {ConsultantId}", id);

            var consultant = await _unitOfWork.Consultants
                .GetConsultantWithUserAndCertificateAsync(id);

            if (consultant == null)
            {
                Serilog.Log.Warning("Consultant with ID {ConsultantId} not found", id);
                throw new EntityNotFoundException("Consultant", id);
            }

            // Check for unique constraints only if fields are provided and different
            if (!string.IsNullOrWhiteSpace(updateConsultantDto.UserName) &&
                updateConsultantDto.UserName != consultant.User.UserName)
            {
                if (await _unitOfWork.Users.UsernameExistsAsync(updateConsultantDto.UserName))
                {
                    Serilog.Log.Warning("Username {UserName} already exists", updateConsultantDto.UserName);
                    throw new DuplicateEntityException("User", "Username", updateConsultantDto.UserName);
                }
                consultant.User.UserName = updateConsultantDto.UserName;
            }

            if (!string.IsNullOrWhiteSpace(updateConsultantDto.Email) &&
                updateConsultantDto.Email != consultant.User.Email)
            {
                if (await _unitOfWork.Users.EmailExistsAsync(updateConsultantDto.Email))
                {
                    Serilog.Log.Warning("Email {Email} already exists", updateConsultantDto.Email);
                    throw new DuplicateEntityException("User", "Email", updateConsultantDto.Email);
                }
                consultant.User.Email = updateConsultantDto.Email;
            }

            // Handle Certificate Update with AsNoTracking to avoid tracking conflicts
            if (!string.IsNullOrWhiteSpace(updateConsultantDto.CertificateName))
            {
                var certificate = await _unitOfWork.Certificates.FirstOrDefaultAsync(
                    c => c.CertificateName == updateConsultantDto.CertificateName,
                    asNoTracking: true);

                if (certificate == null)
                {
                    certificate = new Certificate
                    {
                        CertificateName = updateConsultantDto.CertificateName,
                        DateAcquired = updateConsultantDto.DateAcquired ?? DateTime.UtcNow
                    };
                    await _unitOfWork.Certificates.AddAsync(certificate);
                    await _unitOfWork.SaveChangesAsync(); // Save to generate CertificateID
                }
                consultant.CertificateID = certificate.CertificateID;
            }

            // Update only provided fields
            if (!string.IsNullOrWhiteSpace(updateConsultantDto.FullName))
                consultant.User.FullName = updateConsultantDto.FullName;
            if (!string.IsNullOrWhiteSpace(updateConsultantDto.Degree))
                consultant.Degree = updateConsultantDto.Degree;
            if (updateConsultantDto.HourlyRate.HasValue)
                consultant.HourlyRate = updateConsultantDto.HourlyRate.Value;
            if (!string.IsNullOrWhiteSpace(updateConsultantDto.Specialty))
                consultant.Specialty = updateConsultantDto.Specialty;
            if (!string.IsNullOrWhiteSpace(updateConsultantDto.Experience))
                consultant.Experience = updateConsultantDto.Experience;
            if (!string.IsNullOrWhiteSpace(updateConsultantDto.GoogleMeetLink))
                consultant.GoogleMeetLink = updateConsultantDto.GoogleMeetLink;

            // Handle password change
            if (!string.IsNullOrWhiteSpace(updateConsultantDto.Password))
            {
                if (updateConsultantDto.Password.Length < 8 ||
                    !updateConsultantDto.Password.Any(char.IsUpper) ||
                    !updateConsultantDto.Password.Any(char.IsDigit))
                {
                    Serilog.Log.Warning("Password does not meet requirements for ConsultantID={ConsultantId}", id);
                    throw new InvalidOperationException("Password must have at least 8 characters, including uppercase and numbers.");
                }
                Serilog.Log.Information("Updating Password for ConsultantID={ConsultantId}", id);
                consultant.User.Password = BCrypt.Net.BCrypt.HashPassword(updateConsultantDto.Password);
            }

            // Update timestamps
            consultant.UpdatedAt = DateTime.UtcNow;
            consultant.User.UpdatedAt = DateTime.UtcNow;

            _unitOfWork.Consultants.Update(consultant);
            await _unitOfWork.SaveChangesAsync();

            // Reload consultant with all related data
            var updatedConsultant = await _unitOfWork.Consultants
                .GetConsultantWithUserAndCertificateAsync(id);
            var consultantDto = _mapper.Map<ConsultantDto>(updatedConsultant);

            // Explicitly set additional fields
            consultantDto.UserName = updatedConsultant.User?.UserName ?? "";
            consultantDto.FullName = updatedConsultant.User?.FullName ?? "";
            consultantDto.Email = updatedConsultant.User?.Email ?? "";
            consultantDto.CertificateName = updatedConsultant.Certificate?.CertificateName ?? "";
            consultantDto.DateAcquired = updatedConsultant.Certificate?.DateAcquired;
            consultantDto.Status = updatedConsultant.User?.Status ?? "Inactive";

            return consultantDto;
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

        /*
        public async Task<ConsultantDto> UpdateConsultantProfileAsync(int userId, UpdateConsultantDto updateConsultantDto, bool isAdmin = false)
        {
            Log.Information("Updating consultant profile for UserID={UserId} by {Role}", userId, isAdmin ? "Admin" : "Consultant");

            var consultant = await _unitOfWork.Consultants.GetByUserIdTrackedAsync(userId);
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

            // Đính kèm user và consultant vào DbContext để theo dõi
            //_unitOfWork.Attach(user);
            //_unitOfWork.Attach(consultant);

            _mapper.Map(updateConsultantDto, user);
            _mapper.Map(updateConsultantDto, consultant);

            if (!string.IsNullOrEmpty(updateConsultantDto.Password))
            {
                user.Password = BCrypt.Net.BCrypt.HashPassword(updateConsultantDto.Password);
            }

            user.UpdatedAt = DateTime.UtcNow;
            consultant.UpdatedAt = DateTime.UtcNow;

            // _unitOfWork.Users.Update(user);
            //_unitOfWork.Consultants.Update(consultant);

            await _unitOfWork.SaveChangesAsync();

            var result = _mapper.Map<ConsultantDto>(consultant);
            Log.Information("Updated consultant profile for UserID={UserId} by {Role}", userId, isAdmin ? "Admin" : "Consultant");
            return result;
        }

        */
        public async Task<ConsultantDto> UpdateConsultantProfileAsync(int userId, UpdateConsultantDto updateConsultantDto, bool isAdmin = false)
        {
            Serilog.Log.Information("Updating consultant profile for UserID={UserId} by {Role}", userId, isAdmin ? "Admin" : "Consultant");

            var consultant = await _unitOfWork.Consultants.GetByUserIdTrackedAsync(userId);
            if (consultant == null)
            {
                Serilog.Log.Warning("Consultant with UserID {UserId} not found", userId);
                throw new EntityNotFoundException("Consultant", userId);
            }

            var user = await _unitOfWork.Users.GetByIdAsync(userId);
            if (user == null)
            {
                Serilog.Log.Warning("User with UserID {UserId} not found", userId);
                throw new EntityNotFoundException("User", userId);
            }

            if (!isAdmin && user.UserID != userId)
            {
                Serilog.Log.Warning("Unauthorized access to update consultant profile for UserID={UserId}", userId);
                throw new UnauthorizedAccessException("You can only update your own profile.");
            }

            // Check for unique Email
            if (!string.IsNullOrEmpty(updateConsultantDto.Email) && updateConsultantDto.Email != user.Email)
            {
                if (await _unitOfWork.Users.EmailExistsAsync(updateConsultantDto.Email))
                {
                    Serilog.Log.Warning("Email {Email} already exists", updateConsultantDto.Email);
                    throw new DuplicateEntityException("User", "Email", updateConsultantDto.Email);
                }
            }

            // Handle Certificate Update
            if (!string.IsNullOrEmpty(updateConsultantDto.CertificateName))
            {
                if (consultant.Certificate == null)
                {
                    // Tạo mới Certificate nếu chưa có
                    var newCertificate = new Certificate
                    {
                        CertificateName = updateConsultantDto.CertificateName,
                        DateAcquired = updateConsultantDto.DateAcquired ?? DateTime.UtcNow
                    };
                    await _unitOfWork.Certificates.AddAsync(newCertificate);
                    await _unitOfWork.SaveChangesAsync();
                    consultant.CertificateID = newCertificate.CertificateID;
                    consultant.Certificate = newCertificate; // Liên kết trực tiếp
                }
                else
                {
                    // Cập nhật Certificate hiện có
                    var existingCertificate = consultant.Certificate;
                    existingCertificate.CertificateName = updateConsultantDto.CertificateName;
                    if (updateConsultantDto.DateAcquired.HasValue)
                    {
                        existingCertificate.DateAcquired = updateConsultantDto.DateAcquired.Value;
                    }
                    // Không cần gọi Update, EF sẽ tự theo dõi thay đổi
                }
            }

            // Update only provided fields for User
            if (!string.IsNullOrEmpty(updateConsultantDto.Email))
                user.Email = updateConsultantDto.Email;
            if (!string.IsNullOrEmpty(updateConsultantDto.FullName))
                user.FullName = updateConsultantDto.FullName;

            // Update only provided fields for Consultant
            if (!string.IsNullOrEmpty(updateConsultantDto.Degree))
                consultant.Degree = updateConsultantDto.Degree;
            if (updateConsultantDto.HourlyRate.HasValue)
                consultant.HourlyRate = updateConsultantDto.HourlyRate.Value;
            if (!string.IsNullOrEmpty(updateConsultantDto.Specialty))
                consultant.Specialty = updateConsultantDto.Specialty;
            if (!string.IsNullOrEmpty(updateConsultantDto.Experience))
                consultant.Experience = updateConsultantDto.Experience;
            if (!string.IsNullOrEmpty(updateConsultantDto.GoogleMeetLink))
                consultant.GoogleMeetLink = updateConsultantDto.GoogleMeetLink;

            // Handle password change
            if (!string.IsNullOrEmpty(updateConsultantDto.Password))
            {
                if (updateConsultantDto.Password.Length < 8 ||
                    !updateConsultantDto.Password.Any(char.IsUpper) ||
                    !updateConsultantDto.Password.Any(char.IsDigit))
                {
                    Serilog.Log.Warning("New password does not meet requirements for UserID={UserId}", userId);
                    throw new InvalidOperationException("New password must have at least 8 characters, including uppercase and numbers.");
                }
                Serilog.Log.Information("Consultant updated Password for UserID={UserId}", userId);
                user.Password = BCrypt.Net.BCrypt.HashPassword(updateConsultantDto.Password);
            }

            // Update timestamps
            user.UpdatedAt = DateTime.UtcNow;
            consultant.UpdatedAt = DateTime.UtcNow;

            _unitOfWork.Consultants.Update(consultant);
            await _unitOfWork.SaveChangesAsync();

            // Reload consultant with all related data
            var updatedConsultant = await _unitOfWork.Consultants.GetByUserIdTrackedAsync(userId);
            var consultantDto = _mapper.Map<ConsultantDto>(updatedConsultant);

            // Explicitly set additional fields
            consultantDto.UserName = updatedConsultant.User?.UserName ?? "";
            consultantDto.FullName = updatedConsultant.User?.FullName ?? "";
            consultantDto.Email = updatedConsultant.User?.Email ?? "";
            consultantDto.CertificateName = updatedConsultant.Certificate?.CertificateName ?? "";
            consultantDto.DateAcquired = updatedConsultant.Certificate?.DateAcquired;
            consultantDto.Status = updatedConsultant.User?.Status ?? "Inactive";

            return consultantDto;
        }

        public async Task<IEnumerable<ConsultantDto>> GetConsultantsBySpecialtyAsync(string specialty)
        {
            Log.Information("Retrieving consultants by specialty {Specialty}", specialty);
            var consultants = await _unitOfWork.Consultants.GetConsultantsBySpecialtyAsync(specialty);
            var result = _mapper.Map<IEnumerable<ConsultantDto>>(consultants);
            Log.Information("Retrieved {Count} consultants for specialty {Specialty}", result.Count(), specialty);
            return result;
        }

        public async Task<IEnumerable<ConsultantDto>> GetConsultantsByStatusAsync(string status)
        {
            Log.Information("Retrieving consultants by status {Status}", status);
            var consultants = await _unitOfWork.Consultants.GetConsultantsByStatusAsync(status);
            var result = _mapper.Map<IEnumerable<ConsultantDto>>(consultants);
            Log.Information("Retrieved {Count} consultants with status {Status}", result.Count(), status);
            return result;
        }

        public async Task<Dictionary<string, object>> GetConsultantPerformanceStatsAsync(int consultantId)
        {
            Log.Information("Retrieving performance stats for consultant ID {ConsultantId}", consultantId);
            var repo = _unitOfWork.Consultants;
            var consultationCount = await repo.GetConsultationCountAsync(consultantId);
            var revenue = await repo.GetRevenueAsync(consultantId);
            var cancellationRate = await repo.GetCancellationRateAsync(consultantId);

            var stats = new Dictionary<string, object>
            {
                { "consultationCount", consultationCount },
                { "revenue", revenue },
                { "cancellationRate", cancellationRate }
            };
            Log.Information("Retrieved performance stats for consultant {ConsultantId}: Count={Count}, Revenue={Revenue}, CancellationRate={Rate}%",
                consultantId, consultationCount, revenue, cancellationRate);
            return stats;
        }

        public async Task<ConsultantDto> GetConsultantProfileAsync(int userId)
        {
            var consultant = await _unitOfWork.Consultants.GetByUserIdAsync(userId);
            if (consultant == null)
            {
                throw new EntityNotFoundException("Consultant", userId);
            }

            return _mapper.Map<ConsultantDto>(consultant);
        }

    }
}