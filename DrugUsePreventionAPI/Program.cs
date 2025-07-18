    using DrugUsePreventionAPI.Configurations;
    using DrugUsePreventionAPI.Controllers.Data;
    using DrugUsePreventionAPI.Exceptions;
    using DrugUsePreventionAPI.Mappings;
    using DrugUsePreventionAPI.Models.Entities;
    using DrugUsePreventionAPI.Repositories;
    using DrugUsePreventionAPI.Repositories.Interfaces;
    using DrugUsePreventionAPI.Services.Implementations;
    using DrugUsePreventionAPI.Services.Interfaces;
    using Hangfire;
    using Hangfire.SqlServer;
    using Microsoft.AspNetCore.Authentication.JwtBearer;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.HttpOverrides;
    using Microsoft.EntityFrameworkCore;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.DependencyInjection;
    using Microsoft.Extensions.Options;
    using Microsoft.IdentityModel.Tokens;
    using Microsoft.OpenApi.Models;
    using Serilog;
    using System;
    using System.Security.Claims;
    using System.Text;
    using System.Text.Json;

    var builder = WebApplication.CreateBuilder(args);

    // Configure Serilog for logging
    Log.Logger = new LoggerConfiguration()
        .ReadFrom.Configuration(builder.Configuration)
        .Enrich.FromLogContext()
        .WriteTo.Console()
        .WriteTo.File("Logs/log-.txt", rollingInterval: RollingInterval.Day)
        .CreateLogger();

    builder.Host.UseSerilog();

    // Validate configurations
    var jwtSettings = builder.Configuration.GetSection("JwtSettings");
    var vnPaySettings = builder.Configuration.GetSection("VNPay");
    var gmailSettings = builder.Configuration.GetSection("Gmail");
    var googleSettings = builder.Configuration.GetSection("GoogleCalendar");

    if (string.IsNullOrEmpty(jwtSettings["SecretKey"]))
        throw new InvalidOperationException("JWT SecretKey is missing in configuration.");
    if (string.IsNullOrEmpty(vnPaySettings["TmnCode"]) || string.IsNullOrEmpty(vnPaySettings["HashSecret"]))
        throw new InvalidOperationException("VNPay TmnCode or HashSecret is missing in configuration.");
    if (string.IsNullOrEmpty(gmailSettings["Email"]) || string.IsNullOrEmpty(gmailSettings["Password"]))
        throw new InvalidOperationException("Gmail configuration is missing in configuration.");

    builder.Services.AddHttpContextAccessor();

    // Lấy URL ngrok động và cập nhật ReturnUrl
    string ngrokUrl = GetNgrokUrl();
    if (!string.IsNullOrEmpty(ngrokUrl))
    {
        builder.Configuration["VNPay:ReturnUrl"] = $"{ngrokUrl}/api/vnpay/return";
        Log.Information("Updated ReturnUrl to: {ReturnUrl}", builder.Configuration["VNPay:ReturnUrl"]);
    }
    else
    {
        Log.Warning("Failed to get ngrok URL. Using default ReturnUrl: {ReturnUrl}", vnPaySettings["ReturnUrl"]);
    }

    // Cấu hình CORS cho frontend
    builder.Services.AddCors(options =>
    {
        options.AddPolicy("AllowFrontend", policy =>
        {
            policy.WithOrigins("http://localhost:5173", "http://localhost:7092")
                .AllowAnyHeader()
                .AllowAnyMethod();
        });
    });

    // Add services to the container
    builder.Services.AddControllers().AddJsonOptions(options =>
    {
        options.JsonSerializerOptions.DefaultIgnoreCondition = System.Text.Json.Serialization.JsonIgnoreCondition.Never;
    });

    builder.Services.AddEndpointsApiExplorer();

    // Configure Swagger with Bearer token support
    builder.Services.AddSwaggerGen(c =>
    {
        c.SwaggerDoc("v1", new OpenApiInfo { Title = "Drug Prevention API", Version = "v1" });
        c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
        {
            Name = "Authorization",
            In = ParameterLocation.Header,
            Type = SecuritySchemeType.ApiKey,
            Scheme = "Bearer",
            Description = "Enter token as: Bearer {token}"
        });
        c.AddSecurityRequirement(new OpenApiSecurityRequirement
        {
            {
                new OpenApiSecurityScheme
                {
                    Reference = new OpenApiReference { Type = ReferenceType.SecurityScheme, Id = "Bearer" }
                },
                Array.Empty<string>()
            }
        });
    });

    // Configure DbContext
    builder.Services.AddDbContext<ApplicationDbContext>(options =>
        options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

    // Configure AutoMapper with separate profiles
    builder.Services.AddAutoMapper(typeof(UserMappingProfile), typeof(CourseMappingProfile), typeof(AppointmentMappingProfile), typeof(SurveyMappingProfile));

    // Configure Hangfire for background jobs
    builder.Services.AddHangfire(configuration => configuration
        .SetDataCompatibilityLevel(CompatibilityLevel.Version_180)
        .UseSimpleAssemblyNameTypeSerializer()
        .UseRecommendedSerializerSettings()
        .UseSqlServerStorage(builder.Configuration.GetConnectionString("DefaultConnection")));
    builder.Services.AddHangfireServer();

    // Register configurations
    builder.Services.Configure<JwtSettings>(jwtSettings);
    builder.Services.Configure<VNPaySettings>(vnPaySettings);
    builder.Services.Configure<GmailSettings>(gmailSettings);

// Register repositories
builder.Services.AddScoped(typeof(IGenericRepository<>), typeof(GenericRepository<>));
builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<IRoleRepository, RoleRepository>();
builder.Services.AddScoped<IConsultantRepository, ConsultantRepository>();
builder.Services.AddScoped<ICertificateRepository, CertificateRepository>();
builder.Services.AddScoped<IConsultantScheduleRepository, ConsultantScheduleRepository>();
builder.Services.AddScoped<IPaymentRepository, PaymentRepository>();
builder.Services.AddScoped<IAppointmentRepository, AppointmentRepository>();
builder.Services.AddScoped<IAssessmentRepository, AssessmentRepository>();
builder.Services.AddScoped<IAssessmentResultRepository, AssessmentResultRepository>();
builder.Services.AddScoped<ICourseRepository, CourseRepository>();
builder.Services.AddScoped<ICourseRegistrationRepository, CourseRegistrationRepository>();
builder.Services.AddScoped<ISurveyRepository, SurveyRepository>();
builder.Services.AddScoped<IQuestionRepository, QuestionRepository>();
builder.Services.AddScoped<IAnswerOptionRepository, AnswerOptionRepository>();
builder.Services.AddScoped<IUserCourseProgressRepository, UserCourseProgressRepository>();
builder.Services.AddScoped<ICourseVideoRepository, CourseVideoRepository>();
builder.Services.AddScoped<IAssessmentStatisticsRepository, AssessmentStatisticsRepository>();
builder.Services.AddScoped<ICourseStatisticsRepository, CourseStatisticsRepository>();

builder.Services.AddScoped<IUnitOfWork, UnitOfWork>();

// Register services
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddScoped<IAppointmentService, AppointmentService>();
builder.Services.AddScoped<IConsultantService, ConsultantService>();
builder.Services.AddScoped<ICourseService, CourseService>();
builder.Services.AddScoped<ICourseRegistrationService, CourseRegistrationService>();
builder.Services.AddScoped<IAssessmentService, AssessmentService>();
builder.Services.AddScoped<ISurveyService, SurveyService>();
builder.Services.AddScoped<IAnswerOptionService, AnswerOptionService>();
builder.Services.AddScoped<IQuestionService, QuestionService>();
builder.Services.AddScoped<IAssessmentResultService, AssessmentResultService>();
builder.Services.AddScoped<ScheduleGenerator>();
builder.Services.AddScoped<IEmailService, EmailService>();
builder.Services.AddScoped<IUserCourseProgressService, UserCourseProgressService>();
builder.Services.AddScoped<ICourseVideoService, CourseVideoService>();
builder.Services.AddScoped<IAssessmentStatisticsService, AssessmentStatisticsService>();
builder.Services.AddScoped<ICourseStatisticsService, CourseStatisticsService>();







// Đăng ký VNPayHelper chuẩn DI (constructor sẽ nhận IOptions<VNPaySettings> và IHttpContextAccessor)
builder.Services.AddScoped<VNPayHelper>();

    // Đăng ký Blog chuẩn DI
    builder.Services.AddScoped<IBlogRepository, BlogRepository>();
    builder.Services.AddScoped<IBlogService, BlogService>();

    // Configure JWT Authentication
    var key = Encoding.ASCII.GetBytes(jwtSettings["SecretKey"]);

    builder.Services.AddAuthentication(options =>
    {
        options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
        options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
    })
    .AddJwtBearer(options =>
    {
        options.Events = new JwtBearerEvents
        {
            OnAuthenticationFailed = context =>
            {
                Log.Error(context.Exception, "JWT Authentication failed: {Message}", context.Exception.Message);
                return Task.CompletedTask;
            },
            OnChallenge = context =>
            {
                Log.Warning("JWT Challenge: {Error}, {ErrorDescription}, User Authenticated: {IsAuthenticated}, Roles: {Roles}, Claims: {Claims}",
                    context.Error, context.ErrorDescription, context.HttpContext.User.Identity?.IsAuthenticated ?? false,
                    context.HttpContext.User.Identity?.IsAuthenticated == true ? string.Join(", ", context.HttpContext.User.Claims.Where(c => c.Type == ClaimTypes.Role).Select(c => c.Value)) : "None",
                    context.HttpContext.User.Identity?.IsAuthenticated == true ? string.Join(", ", context.HttpContext.User.Claims.Select(c => $"{c.Type}: {c.Value}")) : "None");
                return Task.CompletedTask;
            },
            OnTokenValidated = context =>
            {
                var user = context.Principal;
                if (user != null)
                {
                    Log.Information("JWT Token validated successfully for user: {User}, Roles: {Roles}, Claims: {Claims}",
                        user.Identity?.Name, string.Join(", ", user.Claims.Where(c => c.Type == ClaimTypes.Role).Select(c => c.Value)),
                        string.Join(", ", user.Claims.Select(c => $"{c.Type}: {c.Value}")));
                }
                return Task.CompletedTask;
            }
        };
        options.RequireHttpsMetadata = false;
        options.SaveToken = true;
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = new SymmetricSecurityKey(key),
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidIssuer = jwtSettings["Issuer"],
            ValidAudience = jwtSettings["Audience"],
            ClockSkew = TimeSpan.FromMinutes(5),
            RoleClaimType = ClaimTypes.Role
        };
    });

    // Configure Authorization
    builder.Services.AddAuthorization(options =>
    {
        options.AddPolicy("Member", policy => policy.RequireRole("Member"));
        options.AddPolicy("MemberOrGuest", policy => policy.RequireRole("Member", "Guest"));
        options.AddPolicy("Staff", policy => policy.RequireRole("Staff"));
        options.AddPolicy("Manager", policy => policy.RequireRole("Manager"));
        options.AddPolicy("Admin,Manager,Staff", policy => policy.RequireRole("Admin", "Manager", "Staff"));
        options.AddPolicy("Admin,Manager,Staff", policy => policy.RequireRole("Admin", "Manager", "Staff"));
        options.AddPolicy("Consultant", policy => policy.RequireRole("Consultant"));
        options.AddPolicy("Admin", policy =>
        {
            policy.RequireRole("Admin");
            policy.RequireAssertion(context =>
            {
                var roles = context.User.Claims.Where(c => c.Type == ClaimTypes.Role).Select(c => c.Value).ToList();
                Log.Information("Evaluating Admin policy for user: {User}, Available Roles: {Roles}", context.User.Identity?.Name, string.Join(", ", roles));
                return roles.Contains("Admin", StringComparer.OrdinalIgnoreCase);
            });
        });
        options.AddPolicy("DefaultPolicy", policy => policy.RequireAuthenticatedUser());
        options.DefaultPolicy = options.GetPolicy("DefaultPolicy");
        options.InvokeHandlersAfterFailure = false;
    });

    var app = builder.Build();

    // Cấu hình để ASP.NET Core sử dụng `X-Forwarded-For` header từ proxy
    app.UseForwardedHeaders(new ForwardedHeadersOptions
    {
        ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto
    });

    // Configure exception handling middleware with detailed logging
    app.UseExceptionHandler(errorApp =>
    {
        errorApp.Run(async context =>
        {
            var errorFeature = context.Features.Get<Microsoft.AspNetCore.Diagnostics.IExceptionHandlerFeature>();
            if (errorFeature != null)
            {
                var exception = errorFeature.Error;
                var response = new { Message = exception.Message, StatusCode = 500, StackTrace = exception.StackTrace };

                switch (exception)
                {
                    case EntityNotFoundException _:
                        response = new { Message = exception.Message, StatusCode = 404, StackTrace = exception.StackTrace };
                        break;
                    case DuplicateEntityException _:
                    case BusinessRuleViolationException _:
                        response = new { Message = exception.Message, StatusCode = 400, StackTrace = exception.StackTrace };
                        break;
                }

                context.Response.StatusCode = response.StatusCode;
                context.Response.ContentType = "application/json";
                await context.Response.WriteAsync(JsonSerializer.Serialize(response));
                Log.Error(exception, "Error occurred: {Message}, StackTrace: {StackTrace}", exception.Message, exception.StackTrace);
            }
        });
    });

    // Configure recurring job for daily schedules
    using (var scope = app.Services.CreateScope())
    {
        var recurringJobManager = scope.ServiceProvider.GetRequiredService<IRecurringJobManager>();
        var scheduleGenerator = scope.ServiceProvider.GetRequiredService<ScheduleGenerator>();
        recurringJobManager.AddOrUpdate(
            "generate-daily-schedules",
            () => scheduleGenerator.GenerateDailySchedulesAsync(DateTime.UtcNow.Date),
            Cron.Daily());

        var unitOfWork = scope.ServiceProvider.GetRequiredService<IUnitOfWork>();
        await SeedAdminAsync(unitOfWork);
    }

    // Configure the HTTP request pipeline
    if (app.Environment.IsDevelopment())
    {
        app.UseSwagger();
        app.UseSwaggerUI();
    }
    else
    {
        app.UseExceptionHandler(errorApp =>
        {
            errorApp.Run(async context =>
            {
                context.Response.StatusCode = 500;
                context.Response.ContentType = "application/json";
                await context.Response.WriteAsync("{\"message\": \"An unexpected error occurred.\"}");
                Log.Error("Unexpected error in production: {Error}", context.Response.StatusCode);
            });
        });
    }

    app.UseHttpsRedirection();
    app.UseAuthentication();
    app.UseCors("AllowFrontend");
    app.UseAuthorization();
    app.UseHangfireDashboard("/hangfire");
    app.MapControllers();

    app.Run();

    async Task SeedAdminAsync(IUnitOfWork unitOfWork)
    {
        try
        {
            if (!await unitOfWork.Users.ExistsAsync(u => u.UserName == "admin"))
            {
                var adminRole = await unitOfWork.Roles.GetByNameAsync("Admin");
                if (adminRole == null)
                {
                    adminRole = new Role { RoleName = "Admin", Description = "Quản trị viên" };
                    await unitOfWork.Roles.AddAsync(adminRole);
                    await unitOfWork.SaveChangesAsync();
                }

                var admin = new User
                {
                    UserName = "admin",
                    Password = BCrypt.Net.BCrypt.HashPassword("Admin123"),
                    Email = "admin@example.com",
                    FullName = "Administrator",
                    RoleID = adminRole.RoleID,
                    Status = "Active",
                    CreatedAt = DateTime.UtcNow,
                    UpdatedAt = DateTime.UtcNow
                };

                await unitOfWork.Users.AddAsync(admin);
                await unitOfWork.SaveChangesAsync();
                Log.Information("Admin user seeded successfully");
            }
        }
        catch (Exception ex)
        {
            Log.Error(ex, "Error seeding admin user");
            throw;
        }
    }
    static string GetNgrokUrl()
    {
        try
        {
            using var client = new HttpClient();
            var response = client.GetStringAsync("http://localhost:4040/api/tunnels").Result;
            var tunnels = JsonSerializer.Deserialize<JsonElement>(response);
            foreach (var tunnel in tunnels.GetProperty("tunnels").EnumerateArray())
            {
                if (tunnel.GetProperty("proto").GetString() == "https")
                {
                    return tunnel.GetProperty("public_url").GetString();
                }
            }
        }
        catch (Exception ex)
        {
            Log.Error(ex, "Failed to get ngrok URL");
        }
        return null;
    }
