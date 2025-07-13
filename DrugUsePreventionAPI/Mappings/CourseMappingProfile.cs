using AutoMapper;
using DrugUsePreventionAPI.Models.DTOs.Course;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Mappings
{ 
    public class CourseMappingProfile : Profile 
    { 
        public CourseMappingProfile() 
        { 
            CreateMap<Course, CreateCourseDto>().ReverseMap();
            CreateMap<CreateCourseVideoDto, CourseVideo>();
            CreateMap<CourseVideo, CreateCourseVideoDto>().ReverseMap();
        }
    } 
}