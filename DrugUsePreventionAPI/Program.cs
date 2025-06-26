using DrugUsePreventionAPI.Services.Implementations;
using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Data.Extensions;
using DrugUsePreventionAPI.Mappings;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Repositories.Interfaces;
using DrugUsePreventionAPI.Configurations;
using Hangfire;
using Hangfire.SqlServer;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Serilog;
using System.Security.Claims;
using System.Text;
using DrugUsePreventionAPI.Exceptions;
using Microsoft.AspNetCore.Http;
using System.Text.Json;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.Configuration;

var builder = WebApplication.CreateBuilder(args);

// Configure Serilog for logging
Log.Logger = new LoggerConfiguration()
    .ReadFrom.Configuration(builder.Configuration)
    .Enrich.FromLogContext()
    .WriteTo.Console()
    .WriteTo.File("Logs/log-.txt", rollingInterval: RollingInterval.Day)
    .CreateLogger();

builder.Host.UseSerilog();

// Cấu hình CORS cho frontend
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowFrontend", policy =>
    {
        policy.WithOrigins("http://localhost:5173") // Địa chỉ của frontend React
            .AllowAnyHeader()
            .AllowAnyMethod();
    });
});

// Add services to the container
builder.Services.AddControllers().AddJsonOptions(options =>
{
    options.JsonSerializerOptions.DefaultIgnoreCondition = System.Text.Json.Serialization.JsonIgnoreCondition.WhenWritingNull;
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
            new string[] { }
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
builder.Services.Configure<JwtSettings>(builder.Configuration.GetSection("JwtSettings"));
builder.Services.Configure<VNPaySettings>(builder.Configuration.GetSection("VNPay"));
builder.Services.Configure<GmailSettings>(builder.Configuration.GetSection("Gmail"));

// Register IConfiguration for services that might need it
builder.Services.AddScoped(sp => builder.Configuration);

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

// Register ScheduleGenerator
builder.Services.AddScoped<ScheduleGenerator>();

// Register VNPayHelper with IOptions
builder.Services.AddScoped(sp => new VNPayHelper(sp.GetRequiredService<IOptions<VNPaySettings>>()));

// Configure JWT Authentication
var jwtSettings = builder.Configuration.GetSection("JwtSettings");
var secretKey = jwtSettings["SecretKey"];
if (string.IsNullOrEmpty(secretKey))
{
    throw new InvalidOperationException("JWT SecretKey is missing in configuration.");
}
var key = Encoding.ASCII.GetBytes(secretKey);

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
                context.Error, context.ErrorDescription, context.HttpContext.User.Identity.IsAuthenticated,
                context.HttpContext.User.Identity.IsAuthenticated ? string.Join(", ", context.HttpContext.User.Claims.Where(c => c.Type == ClaimTypes.Role).Select(c => c.Value)) : "None",
                context.HttpContext.User.Identity.IsAuthenticated ? string.Join(", ", context.HttpContext.User.Claims.Select(c => $"{c.Type}: {c.Value}")) : "None");
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
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(jwtSettings["SecretKey"])),
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
    options.AddPolicy("MemberOrGuest", policy => policy.RequireRole("Member", "Guest"));
    options.AddPolicy("Consultant", policy => policy.RequireRole("Consultant"));
    options.AddPolicy("Admin", policy =>
    {
        policy.RequireRole("Admin");
        policy.RequireAssertion(context =>
        {
            var roles = context.User.Claims.Where(c => c.Type == ClaimTypes.Role).Select(c => c.Value).ToList();
            Log.Information("Evaluating Admin policy for user: {User}, Available Roles: {Roles}", context.User.Identity.Name, string.Join(", ", roles));
            return roles.Contains("Admin", StringComparer.OrdinalIgnoreCase);
        });
    });
    options.AddPolicy("AdminOrManager", policy => policy.RequireRole("Admin", "Manager"));
    options.AddPolicy("DefaultPolicy", policy => policy.RequireAuthenticatedUser());
    options.DefaultPolicy = options.GetPolicy("DefaultPolicy");
    options.InvokeHandlersAfterFailure = false;
});

// Configure CORS
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowFrontend", policy =>
    {
        policy.WithOrigins("http://localhost:5173", "https://localhost:5173")
              .AllowAnyHeader()
              .AllowAnyMethod()
              .AllowCredentials();
    });
});

var app = builder.Build();

// Configure exception handling middleware
app.UseExceptionHandler(errorApp =>
{
    errorApp.Run(async context =>
    {
        var errorFeature = context.Features.Get<Microsoft.AspNetCore.Diagnostics.IExceptionHandlerFeature>();
        if (errorFeature != null)
        {
            var exception = errorFeature.Error;
            var response = new { Message = exception.Message, StatusCode = 500 };

            switch (exception)
            {
                case EntityNotFoundException _:
                    response = new { Message = exception.Message, StatusCode = 404 };
                    break;
                case DuplicateEntityException _:
                case BusinessRuleViolationException _:
                    response = new { Message = exception.Message, StatusCode = 400 };
                    break;
            }

            context.Response.StatusCode = response.StatusCode;
            context.Response.ContentType = "application/json";
            await context.Response.WriteAsync(JsonSerializer.Serialize(response));
            Log.Error(exception, "Error occurred: {Message}", exception.Message);
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
        () => scheduleGenerator.GenerateDailySchedulesAsync(DateTime.Now.Date),
        Cron.Daily());
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

// Apply CORS policy
app.UseCors("AllowFrontend");

// Custom middleware for OPTIONS preflight
app.Use(async (context, next) =>
{
    if (context.Request.Method == "OPTIONS")
    {
        context.Response.Headers.Add("Access-Control-Allow-Origin", "http://localhost:5173");
        context.Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
        context.Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, Authorization");
        context.Response.StatusCode = 204;
        return;
    }
    await next();
});

app.UseHttpsRedirection();
app.UseAuthentication();
app.UseCors("AllowFrontend");
app.UseAuthorization();
app.UseHangfireDashboard("/hangfire");
app.UseCors("AllowFrontend");
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
                adminRole = new Role { RoleName = "Admin", Description = "Administrator role" };
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
