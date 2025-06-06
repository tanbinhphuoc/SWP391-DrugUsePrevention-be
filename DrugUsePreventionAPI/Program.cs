﻿using DrugPreventionAPI.Services.Implementations;
using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Data.Extensions;
using DrugUsePreventionAPI.Mappings;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Implementations;
using DrugUsePreventionAPI.Services.Interfaces;
using Hangfire;
using Hangfire.SqlServer;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.StackExchangeRedis;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Serilog;
using System.Security.Claims;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Configure Serilog for logging
Log.Logger = new LoggerConfiguration()
    .ReadFrom.Configuration(builder.Configuration)
    .Enrich.FromLogContext()
    .WriteTo.Console()
    .WriteTo.File("Logs/log-.txt", rollingInterval: RollingInterval.Day)
    .CreateLogger();

builder.Host.UseSerilog();

// Add services to the container
builder.Services.AddControllers();
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

// Configure AutoMapper
builder.Services.AddAutoMapper(typeof(MappingProfile));

// Configure Redis Cache
builder.Services.AddStackExchangeRedisCache(options =>
{
    options.Configuration = builder.Configuration.GetValue<string>("Redis:ConnectionString") ?? "localhost:6379";
    options.InstanceName = "DrugUsePreventionAPI_";
});

// Configure Hangfire for background jobs
builder.Services.AddHangfire(configuration => configuration
    .SetDataCompatibilityLevel(CompatibilityLevel.Version_180)
    .UseSimpleAssemblyNameTypeSerializer()
    .UseRecommendedSerializerSettings()
    .UseSqlServerStorage(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddHangfireServer();

// Register services
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddScoped<IAppointmentService, AppointmentService>();
builder.Services.AddScoped<ScheduleGenerator>();
builder.Services.AddScoped<IConsultantService, ConsultantService>();
builder.Services.AddScoped<ICourseService, CourseService>();
builder.Services.AddScoped<IAssessmentService, AssessmentService>();
builder.Services.AddScoped<ISurveyService, SurveyService>();
builder.Services.AddScoped<IAnswerOptionService, AnswerOptionService>();
builder.Services.AddScoped<IQuestionService, QuestionService>();



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
                context.Error,
                context.ErrorDescription,
                context.HttpContext.User.Identity.IsAuthenticated,
                context.HttpContext.User.Identity.IsAuthenticated
                    ? string.Join(", ", context.HttpContext.User.Claims.Where(c => c.Type == ClaimTypes.Role).Select(c => c.Value))
                    : "None",
                context.HttpContext.User.Identity.IsAuthenticated
                    ? string.Join(", ", context.HttpContext.User.Claims.Select(c => $"{c.Type}: {c.Value}"))
                    : "None");
            return Task.CompletedTask;
        },
        OnTokenValidated = context =>
        {
            var user = context.Principal;
            if (user != null)
            {
                Log.Information("JWT Token validated successfully for user: {User}, Roles: {Roles}, Claims: {Claims}",
                    user.Identity?.Name,
                    string.Join(", ", user.Claims.Where(c => c.Type == ClaimTypes.Role).Select(c => c.Value)),
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
            Log.Information("Evaluating Admin policy for user: {User}, Available Roles: {Roles}",
                context.User.Identity.Name,
                string.Join(", ", roles));
            return roles.Contains("Admin", StringComparer.OrdinalIgnoreCase);
        });
    });
    options.AddPolicy("AdminOrManager", policy => policy.RequireRole("Admin", "Manager"));
    options.AddPolicy("DefaultPolicy", policy => policy.RequireAuthenticatedUser());
    options.DefaultPolicy = options.GetPolicy("DefaultPolicy");
    options.InvokeHandlersAfterFailure = false;
});

var app = builder.Build();

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
app.UseAuthorization();
app.UseHangfireDashboard("/hangfire");
app.MapControllers();

app.Run();

async Task SeedAdminAsync(ApplicationDbContext context)
{
    try
    {
        if (!await context.Users.AnyAsync(u => u.UserName == "admin"))
        {
            var adminRole = await context.Roles.FirstOrDefaultAsync(r => r.RoleName == "Admin");
            if (adminRole == null)
            {
                adminRole = new Role { RoleName = "Admin", Description = "Administrator role" };
                context.Roles.Add(adminRole);
                await context.SaveChangesAsync();
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

            context.Users.Add(admin);
            await context.SaveChangesAsync();
            Log.Information("Admin user seeded successfully");
        }
    }
    catch (Exception ex)
    {
        Log.Error(ex, "Error seeding admin user");
        throw;
    }
}
