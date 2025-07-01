using DrugUsePreventionAPI.Models.Entities;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options) { }

        public DbSet<User> Users { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Consultant> Consultants { get; set; }
        public DbSet<Certificate> Certificates { get; set; }
        public DbSet<ConsultantSchedule> ConsultantSchedules { get; set; }
        public DbSet<Course> Courses { get; set; }
        public DbSet<Blog> Blogs { get; set; }
        public DbSet<CourseRegistration> CourseRegistrations { get; set; }
        public DbSet<Appointment> Appointments { get; set; }
        public DbSet<ConsultantAppointmentEvaluation> ConsultantAppointmentEvaluations { get; set; }
        public DbSet<Assessment> Assessments { get; set; }
        public DbSet<CourseAssessment> CourseAssessments { get; set; }
        public DbSet<AssessmentResult> AssessmentResults { get; set; }
        public DbSet<Survey> Surveys { get; set; }
        public DbSet<Question> Questions { get; set; }
        public DbSet<AnswerOption> AnswerOptions { get; set; }
        public DbSet<CommunicationProgram> CommunicationPrograms { get; set; }
        public DbSet<ProgramParticipation> ProgramParticipations { get; set; }
        public DbSet<SurveyResponse> SurveyResponses { get; set; }
        public DbSet<Payment> Payments { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Composite keys
            modelBuilder.Entity<CourseRegistration>()
                .HasKey(cr => new { cr.UserID, cr.CourseID });

            modelBuilder.Entity<CourseAssessment>()
                .HasKey(ca => new { ca.CourseID, ca.AssessmentID });

            modelBuilder.Entity<ProgramParticipation>()
                .HasKey(pp => new { pp.UserID, pp.ProgramID });

            // Payment configuration
            modelBuilder.Entity<Payment>()
                .Property(p => p.Amount)
                .HasColumnType("decimal(10,2)");

            modelBuilder.Entity<Payment>()
                .HasOne(p => p.User)
                .WithMany(u => u.Payments)
                .HasForeignKey(p => p.UserID)
                .OnDelete(DeleteBehavior.Restrict)
                .IsRequired();
            modelBuilder.Entity<CourseAssessment>()
                .HasOne(ca => ca.Course)
                .WithMany(c => c.CourseAssessments)
                .HasForeignKey(ca => ca.CourseID);

            modelBuilder.Entity<CourseAssessment>()
                .HasOne(ca => ca.Assessment)
                .WithMany(a => a.CourseAssessments)
                .HasForeignKey(ca => ca.AssessmentID);


            modelBuilder.Entity<Payment>()
                .HasOne(p => p.Appointment)
                .WithMany() // No reverse navigation needed in Appointment
                .HasForeignKey(p => p.AppointmentID)
                .OnDelete(DeleteBehavior.Restrict)
                .IsRequired(false); // AppointmentID can be NULL

            modelBuilder.Entity<Payment>()
                .HasOne(p => p.Course)
                .WithMany(c => c.Payments)
                .HasForeignKey(p => p.CourseID)
                .OnDelete(DeleteBehavior.Restrict)
                .IsRequired(false); // CourseID can be NULL

            // Appointment configuration
            modelBuilder.Entity<Appointment>()
                .Property(a => a.Price)
                .HasColumnType("decimal(10,2)");

            modelBuilder.Entity<Appointment>()
                .HasOne(a => a.User)
                .WithMany(u => u.Appointments)
                .HasForeignKey(a => a.UserID)
                .OnDelete(DeleteBehavior.Restrict)
                .IsRequired();

            modelBuilder.Entity<Appointment>()
                .HasOne(a => a.Consultant)
                .WithMany(c => c.Appointments)
                .HasForeignKey(a => a.ConsultantID)
                .OnDelete(DeleteBehavior.Restrict)
                .IsRequired();

            // Consultant configuration
            modelBuilder.Entity<Consultant>()
                .Property(c => c.HourlyRate)
                .HasColumnType("decimal(10,2)");

            modelBuilder.Entity<Consultant>()
                .Property(c => c.GoogleMeetLink)
                .HasMaxLength(255)
                .IsUnicode(true)
                .IsRequired(false);

            modelBuilder.Entity<Consultant>()
                .HasOne(c => c.User)
                .WithOne(u => u.Consultant)
                .HasForeignKey<Consultant>(c => c.UserID)
                .OnDelete(DeleteBehavior.Restrict)
                .IsRequired();

            // SurveyResponse configuration
            modelBuilder.Entity<SurveyResponse>()
                .HasOne(sr => sr.User)
                .WithMany(u => u.SurveyResponses)
                .HasForeignKey(sr => sr.UserID)
                .OnDelete(DeleteBehavior.Restrict)
                .IsRequired();

            modelBuilder.Entity<SurveyResponse>()
                .HasOne(sr => sr.Survey)
                .WithMany(s => s.SurveyResponses)
                .HasForeignKey(sr => sr.SurveyID)
                .OnDelete(DeleteBehavior.Restrict)
                .IsRequired();

            modelBuilder.Entity<SurveyResponse>()
                .HasOne(sr => sr.Program)
                .WithMany(p => p.SurveyResponses)
                .HasForeignKey(sr => sr.ProgramID)
                .OnDelete(DeleteBehavior.Restrict)
                .IsRequired(false); // ProgramID can be NULL

            // ConsultantSchedule index
            modelBuilder.Entity<ConsultantSchedule>()
                .HasIndex(s => new { s.ConsultantID, s.Date, s.IsAvailable });
        }
    }
}
