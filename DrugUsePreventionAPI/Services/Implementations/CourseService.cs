using DrugUsePreventionAPI.Exceptions;
using DrugUsePreventionAPI.Models.DTOs.Course;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories;
using DrugUsePreventionAPI.Services.Interfaces;
using Serilog;

public class CourseService : ICourseService
{
    private readonly IUnitOfWork _unitOfWork;

    public CourseService(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<int?> CreateCourse(CreateCourseDto courseDto)
    {
        try
        {
            if (courseDto.Type != "HocSinh" && courseDto.Type != "SinhVien" && courseDto.Type != "PhuHuynh")
                throw new BusinessRuleViolationException("Loại khóa học không hợp lệ.");

            var validStatuses = new[] { "OPEN", "CLOSED", "PENDING" };
            if (!validStatuses.Contains(courseDto.Status?.ToUpper()))
                throw new BusinessRuleViolationException("Trạng thái khóa học chỉ được là 'OPEN', 'CLOSED' hoặc 'PENDING'.");

            var existingCourse = await _unitOfWork.Courses.GetCourseByTypeAsync(courseDto.Type);
            if (existingCourse != null && !existingCourse.IsDeleted)
                throw new BusinessRuleViolationException($"Khóa học cho loại '{courseDto.Type}' đã tồn tại.");

            var course = new Course
            {
                CourseName = courseDto.CourseName,
                Description = courseDto.Description,
                StartDate = courseDto.StartDate,
                EndDate = courseDto.EndDate,
                Status = courseDto.Status,
                AgeMin = courseDto.AgeMin,
                AgeMax = courseDto.AgeMax,
                Capacity = courseDto.Capacity,
                Price = courseDto.Price,
                Type = courseDto.Type,
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow,
                IsDeleted = false
            };

            await _unitOfWork.Courses.AddAsync(course);
            await _unitOfWork.SaveChangesAsync();

            Log.Information("Created course {Title} with ID {CourseId}", course.CourseName, course.CourseID);
            return course.CourseID; //  trả ID
        }
        catch (BusinessRuleViolationException)
        {
            throw;
        }
        catch (Exception ex)
        {
            Log.Error(ex, "Error occurred while creating course");
            return null;
        }
    }


    public async Task<bool> UpdateCourse(int id, CreateCourseDto courseDto)
    {
        if (courseDto.Type != "HocSinh" && courseDto.Type != "SinhVien" && courseDto.Type != "PhuHuynh")
        {
            Log.Warning("Invalid course type {Type}", courseDto.Type);
            throw new BusinessRuleViolationException("Course type must be HocSinh or SinhVien or PhuHuynh.");
        }

        var validStatuses = new[] { "OPEN", "CLOSED", "PENDING" };
        if (!validStatuses.Contains(courseDto.Status?.ToUpper()))
            throw new BusinessRuleViolationException("Trạng thái khóa học chỉ được là 'OPEN', 'CLOSED' hoặc 'PENDING'.");

        var course = await _unitOfWork.Courses.GetByIdAsync(id);
        if (course == null || course.IsDeleted)
        {
            Log.Warning("Course with ID {CourseId} not found or deleted", id);
            throw new EntityNotFoundException("Course", id);
        }

        course.CourseName = courseDto.CourseName;
        course.Description = courseDto.Description;
        course.StartDate = courseDto.StartDate;
        course.EndDate = courseDto.EndDate;
        course.Status = courseDto.Status;
        course.AgeMin = courseDto.AgeMin;
        course.AgeMax = courseDto.AgeMax;
        course.Capacity = courseDto.Capacity;
        course.Price = courseDto.Price;
        course.Type = courseDto.Type;
        course.UpdatedAt = DateTime.UtcNow;

        _unitOfWork.Courses.Update(course);
        await _unitOfWork.SaveChangesAsync();
        Log.Information("Updated course {CourseName}", course.CourseName);
        return true;
    }

    public async Task<List<Course>> GetAllCourses()
    {
        Log.Information("Retrieving all courses");
        var courses = await _unitOfWork.Courses.GetAllActiveCourses(); // Có điều kiện IsDeleted = false trong đó
        Log.Information("Retrieved {Count} courses", courses.Count);
        return courses;
    }

    public async Task<Course?> GetCourseById(int id)
    {
        Log.Information("Retrieving course with ID {CourseId}", id);
        var courseList = await _unitOfWork.Courses.FindAsync(c => c.CourseID == id && !c.IsDeleted);
        var course = courseList.FirstOrDefault();
        if (course == null)
        {
            Log.Warning("Course with ID {CourseId} not found or deleted", id);
            throw new EntityNotFoundException("Course", id);
        }

        Log.Information("Retrieved course {CourseName}", course.CourseName);
        return course;
    }

    public async Task<bool> DeleteCourse(int id)
    {
        Log.Information("Soft deleting course with ID {CourseId}", id);
        var course = await _unitOfWork.Courses.GetByIdAsync(id);
        if (course == null || course.IsDeleted)
        {
            Log.Warning("Course with ID {CourseId} not found or already deleted", id);
            return false;
        }

        try
        {
            course.IsDeleted = true;
            _unitOfWork.Courses.Update(course);
            await _unitOfWork.SaveChangesAsync();

            Log.Information("Soft deleted course {CourseName}", course.CourseName);
            return true;
        }
        catch (Exception ex)
        {
            Log.Error(ex, "Error when soft deleting course with ID {CourseId}", id);
            return false;
        }
    }

    public async Task<bool> IsGetCourse(double score)
    {
        return score <= 4;
    }

    public async Task<List<Course>> GetCoursesByAge(int age)
    {
        var allCourses = await _unitOfWork.Courses.GetAllActiveCourses(); // Đã lọc IsDeleted
        var courses = allCourses.Where(c => c.AgeMin <= age && c.AgeMax >= age).ToList();
        return courses;
    }
}
