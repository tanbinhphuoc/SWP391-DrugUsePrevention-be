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
            Log.Information("Admin updating consultant with ID {ConsultantId}", id);
            var consultant = await _unitOfWork.Consultants.GetConsultantWithUserAndCertificateAsync(id);
            if (consultant == null)
            {
                Log.Warning("Consultant with ID {ConsultantId} not found", id);
                throw new EntityNotFoundException("Consultant", id);
            }

            // Check if username and email are unique (existing logic)
            if (!string.IsNullOrEmpty(updateConsultantDto.UserName) && updateConsultantDto.UserName != consultant.User.UserName)
            {
                if (await _unitOfWork.Users.UsernameExistsAsync(updateConsultantDto.UserName))
                {
                    Log.Warning("Username {UserName} already exists", updateConsultantDto.UserName);
                    throw new DuplicateEntityException("User", "Username", updateConsultantDto.UserName);
                }
                Log.Information("Admin updated UserName for ConsultantID={ConsultantId} from {OldUserName} to {NewUserName}", id, consultant.User.UserName, updateConsultantDto.UserName);
            }

            if (!string.IsNullOrEmpty(updateConsultantDto.Email) && updateConsultantDto.Email != consultant.User.Email)
            {
                if (await _unitOfWork.Users.EmailExistsAsync(updateConsultantDto.Email))
                {
                    Log.Warning("Email {Email} already exists", updateConsultantDto.Email);
                    throw new DuplicateEntityException("User", "Email", updateConsultantDto.Email);
                }
            }

            // Handle Certificate Update (avoid tracking multiple instances of the same Certificate)
            if (!string.IsNullOrEmpty(updateConsultantDto.CertificateName))
            {
                // Find certificate without tracking
                var certificate = await _unitOfWork.Certificates
                    .FirstOrDefaultAsync(c => c.CertificateName == updateConsultantDto.CertificateName);

                if (certificate == null)
                {
                    // Create new certificate if not found
                    certificate = new Certificate
                    {
                        CertificateName = updateConsultantDto.CertificateName,
                        DateAcquired = updateConsultantDto.DateAcquired ?? DateTime.UtcNow
                    };
                    await _unitOfWork.Certificates.AddAsync(certificate);
                }
                else if (updateConsultantDto.DateAcquired.HasValue)
                {
                    // Avoid reattaching the same certificate, handle tracked entity explicitly
                    var trackedCertificate = _unitOfWork.GetContext().ChangeTracker.Entries<Certificate>()
                        .FirstOrDefault(e => e.Entity.CertificateID == certificate.CertificateID)?.Entity;

                    if (trackedCertificate != null)
                    {
                        _unitOfWork.GetContext().Entry(trackedCertificate).State = EntityState.Detached; // Detach tracked instance
                    }

                    // Update the DateAcquired for the certificate
                    certificate.DateAcquired = updateConsultantDto.DateAcquired.Value;
                }

                // Assign the certificate ID to the consultant
                consultant.CertificateID = certificate.CertificateID;
            }

            // Map updates to user and consultant
            _mapper.Map(updateConsultantDto, consultant.User);
            _mapper.Map(updateConsultantDto, consultant);

            // Handle password change
            if (!string.IsNullOrEmpty(updateConsultantDto.Password))
            {
                if (updateConsultantDto.Password.Length < 8 ||
                    !updateConsultantDto.Password.Any(char.IsUpper) ||
                    !updateConsultantDto.Password.Any(char.IsDigit))
                {
                    Log.Warning("Password does not meet requirements for ConsultantID={ConsultantId}", id);
                    throw new InvalidOperationException("Password must have at least 8 characters, including uppercase and numbers.");
                }
                Log.Information("Admin updated Password for ConsultantID={ConsultantId}", id);
                consultant.User.Password = BCrypt.Net.BCrypt.HashPassword(updateConsultantDto.Password);
            }

            consultant.UpdatedAt = DateTime.UtcNow;
            consultant.User.UpdatedAt = DateTime.UtcNow;

            _unitOfWork.Consultants.Update(consultant);
            await _unitOfWork.SaveChangesAsync();

            // Reload consultant to ensure latest data
            var result = await _unitOfWork.Consultants.GetConsultantWithUserAndCertificateAsync(id);
            return _mapper.Map<ConsultantDto>(result);
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

            // Check for unique Email
            if (!string.IsNullOrEmpty(updateConsultantDto.Email) && updateConsultantDto.Email != user.Email)
            {
                if (await _unitOfWork.Users.EmailExistsAsync(updateConsultantDto.Email))
                {
                    Log.Warning("Email {Email} already exists", updateConsultantDto.Email);
                    throw new DuplicateEntityException("User", "Email", updateConsultantDto.Email);
                }
            }

            // Handle Certificate Update (Replace the CertificateName without creating a new one)
            if (!string.IsNullOrEmpty(updateConsultantDto.CertificateName))
            {
                var certificate = await _unitOfWork.Certificates
                    .FirstOrDefaultAsync(c => c.CertificateID == consultant.CertificateID);

                if (certificate != null)
                {
                    // Update the existing certificate with the new CertificateName
                    certificate.CertificateName = updateConsultantDto.CertificateName;

                    if (updateConsultantDto.DateAcquired.HasValue)
                    {
                        certificate.DateAcquired = updateConsultantDto.DateAcquired.Value;
                    }

                    _unitOfWork.Certificates.Update(certificate);
                    await _unitOfWork.SaveChangesAsync(); // Save the updated certificate
                }
                else
                {
                    // Handle the case where the certificate doesn't exist
                    if (!consultant.CertificateID.HasValue)
                    {
                        Log.Warning("Consultant with UserID {UserId} has no associated certificate.", userId);
                        throw new EntityNotFoundException("Certificate", "No certificate found for the consultant.");
                    }

                    Log.Warning("Certificate with ID {CertificateID} not found for ConsultantID={UserId}", consultant.CertificateID, userId);
                    throw new EntityNotFoundException("Certificate", consultant.CertificateID.Value); // Ensure we pass a non-nullable int
                }
            }


            // Map updates to user and consultant
            _mapper.Map(updateConsultantDto, user);
            _mapper.Map(updateConsultantDto, consultant);

            // Directly update the password (no old password check)
            if (!string.IsNullOrEmpty(updateConsultantDto.Password))
            {
                if (updateConsultantDto.Password.Length < 8 ||
                    !updateConsultantDto.Password.Any(char.IsUpper) ||
                    !updateConsultantDto.Password.Any(char.IsDigit))
                {
                    Log.Warning("New password does not meet requirements for UserID={UserId}", userId);
                    throw new InvalidOperationException("New password must have at least 8 characters, including uppercase and numbers.");
                }

                Log.Information("Consultant updated Password for UserID={UserId}", userId);
                user.Password = BCrypt.Net.BCrypt.HashPassword(updateConsultantDto.Password);
            }

            user.UpdatedAt = DateTime.UtcNow;
            consultant.UpdatedAt = DateTime.UtcNow;

            _unitOfWork.Consultants.Update(consultant);
            await _unitOfWork.SaveChangesAsync(); // Save changes for the Consultant

            var result = await _unitOfWork.Consultants.GetConsultantWithUserAndCertificateAsync(userId);
            return _mapper.Map<ConsultantDto>(result);
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

    }
}