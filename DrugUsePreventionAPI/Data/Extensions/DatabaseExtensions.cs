﻿using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories;
using Microsoft.EntityFrameworkCore;
using System;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Controllers.Data.Extensions
{
    public static class DatabaseExtensions
    {
        public static async Task SeedTestDataAsync(this ApplicationDbContext context)
        {
            try
            {
                // Khởi tạo UnitOfWork với tất cả các repository cần thiết
                var unitOfWork = new UnitOfWork(
                    context,
                    new UserRepository(context),
                    new RoleRepository(context),
                    new ConsultantRepository(context),
                    new CertificateRepository(context),
                    new ConsultantScheduleRepository(context),
                    new PaymentRepository(context),
                    new AppointmentRepository(context),
                    new AssessmentRepository(context),
                    new AssessmentResultRepository(context),
                    new CourseRepository(context),
                    new CourseRegistrationRepository(context),
                    new SurveyRepository(context),
                    new QuestionRepository(context),
                    new AnswerOptionRepository(context),
                    new CourseVideoRepository(context),
                    new UserCourseProgressesRepository(context)
                );

                // Seed roles if they don't exist
                if (!await context.Roles.AnyAsync(r => r.RoleName == "Admin"))
                {
                    context.Roles.Add(new Role { RoleName = "Admin", Description = "Administrator role" });
                    await context.SaveChangesAsync();
                    Serilog.Log.Information("Admin role seeded successfully");
                }

                if (!await context.Roles.AnyAsync(r => r.RoleName == "Member"))
                {
                    context.Roles.Add(new Role { RoleName = "Member", Description = "Member role" });
                    await context.SaveChangesAsync();
                    Serilog.Log.Information("Member role seeded successfully");
                }

                if (!await context.Roles.AnyAsync(r => r.RoleName == "Consultant"))
                {
                    context.Roles.Add(new Role { RoleName = "Consultant", Description = "Consultant role" });
                    await context.SaveChangesAsync();
                    Serilog.Log.Information("Consultant role seeded successfully");
                }

                // Seed a test member if none exist
                if (!await context.Users.AnyAsync(u => u.Role.RoleName == "Member"))
                {
                    var memberRole = await context.Roles.FirstOrDefaultAsync(r => r.RoleName == "Member");
                    var member = new User
                    {
                        UserName = "member1",
                        Password = BCrypt.Net.BCrypt.HashPassword("Password123!"),
                        Email = "member1@drugprevention.org",
                        FullName = "Jane Doe",
                        RoleID = memberRole.RoleID,
                        Status = "Active",
                        CreatedAt = DateTime.UtcNow,
                        UpdatedAt = DateTime.UtcNow
                    };
                    context.Users.Add(member);
                    await context.SaveChangesAsync();
                    Serilog.Log.Information("Test member seeded successfully");
                }

                // Seed a test consultant if none exist
                if (!await context.Consultants.AnyAsync())
                {
                    var consultantRole = await context.Roles.FirstOrDefaultAsync(r => r.RoleName == "Consultant");
                    var consultantUser = new User
                    {
                        UserName = "consultant1",
                        Password = BCrypt.Net.BCrypt.HashPassword("Password123!"),
                        Email = "consultant1@drugprevention.org",
                        FullName = "Dr. John Smith",
                        RoleID = consultantRole.RoleID,
                        Status = "Active",
                        CreatedAt = DateTime.UtcNow,
                        UpdatedAt = DateTime.UtcNow
                    };
                    context.Users.Add(consultantUser);
                    await context.SaveChangesAsync();

                    var certificate = new Certificate
                    {
                        CertificateName = "Certified Addiction Counselor",
                        DateAcquired = DateTime.UtcNow.AddYears(-2)
                    };
                    context.Certificates.Add(certificate);
                    await context.SaveChangesAsync();

                    var consultant = new Consultant
                    {
                        UserID = consultantUser.UserID,
                        CertificateID = certificate.CertificateID,
                        Specialty = "Addiction Prevention",
                        Degree = "PhD in Psychology",
                        Experience = "10 years in addiction counseling",
                        HourlyRate = 100.00m,
                        CreatedAt = DateTime.UtcNow,
                        UpdatedAt = DateTime.UtcNow
                    };
                    context.Consultants.Add(consultant);
                    await context.SaveChangesAsync();
                    Serilog.Log.Information("Test consultant seeded successfully");
                }

                // Generate schedules for the next day using UnitOfWork
                var generator = new ScheduleGenerator(unitOfWork); // Sử dụng UnitOfWork thay vì ApplicationDbContext trực tiếp
                await generator.GenerateDailySchedulesAsync(DateTime.UtcNow.AddDays(1));
            }
            catch (Exception ex)
            {
                Serilog.Log.Error(ex, "Error seeding test data");
                throw;
            }
        }

    }
}