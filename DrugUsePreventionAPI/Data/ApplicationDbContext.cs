
using DrugUsePreventionAPI.Models.Entities;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
  

        public DbSet<User> Users { get; set; }
        public DbSet<Role> Roles { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<CourseRegistration>()
                .HasKey(cr => new { cr.UserID, cr.CourseID });

            modelBuilder.Entity<CourseAssessment>()
                .HasKey(ca => new { ca.CourseID, ca.AssessmentID });

            modelBuilder.Entity<ProgramParticipation>()
                .HasKey(pp => new { pp.UserID, pp.ProgramID });

            // Configure relationships
            modelBuilder.Entity<User>()
                .HasOne(u => u.Role)
                .WithMany(r => r.Users)
                .HasForeignKey(u => u.RoleID);

            modelBuilder.Entity<Blog>()
                .HasOne(b => b.Author)
                .WithMany(u => u.Blogs)
                .HasForeignKey(b => b.AuthorID);

            modelBuilder.Entity<Consultant>()
                .HasOne(c => c.User)
                .WithMany()
                .HasForeignKey(c => c.UserID);

            modelBuilder.Entity<Appointment>()
                .HasOne(a => a.User)
                .WithMany(u => u.Appointments)
                .HasForeignKey(a => a.UserID);

            modelBuilder.Entity<Appointment>()
                .HasOne(a => a.Consultant)
                .WithMany(c => c.Appointments)
                .HasForeignKey(a => a.ConsultantID);

            // Configure decimal properties
            modelBuilder.Entity<Course>()
                .Property(c => c.Price)
                .HasColumnType("decimal(10,2)");

            modelBuilder.Entity<Consultant>()
                .Property(c => c.HourlyRate)
                .HasColumnType("decimal(10,2)");

            modelBuilder.Entity<Appointment>()
                .Property(a => a.Price)
                .HasColumnType("decimal(10,2)");

            modelBuilder.Entity<Payment>()
                .Property(p => p.Amount)
                .HasColumnType("decimal(10,2)");
        }

}
}
