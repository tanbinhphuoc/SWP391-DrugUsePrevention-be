using AutoMapper;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Mappings 
{ 
    public class UserMappingProfile : Profile 
    {
        public UserMappingProfile() 
        {
            CreateMap<User, UserDto>().ForMember(dest => dest.RoleName, opt => opt.MapFrom(src => src.Role.RoleName));     
            CreateMap<CreateUserDto, User>();
            CreateMap<UpdateUserDto, User>();
            CreateMap<CreateUserByAdminDto, User>();
            CreateMap<CreateConsultantDto, User>()
              .ForMember(dest => dest.UserName, opt => opt.MapFrom(src => src.UserName))
              .ForMember(dest => dest.Password, opt => opt.MapFrom(src => src.Password))
              .ForMember(dest => dest.Email, opt => opt.MapFrom(src => src.Email))
              .ForMember(dest => dest.FullName, opt => opt.MapFrom(src => src.FullName))
              .ForMember(dest => dest.Status, opt => opt.MapFrom(src => "Active"))
              .ForMember(dest => dest.CreatedAt, opt => opt.MapFrom(src => DateTime.UtcNow))
              .ForMember(dest => dest.UpdatedAt, opt => opt.MapFrom(src => DateTime.UtcNow));
            CreateMap<UpdateConsultantDto, User>()
              .ForMember(dest => dest.UserName, opt => opt.MapFrom(src => src.UserName))
              .ForMember(dest => dest.Password, opt => opt.MapFrom(src => src.Password))
              .ForMember(dest => dest.Email, opt => opt.MapFrom(src => src.Email))
              .ForMember(dest => dest.FullName, opt => opt.MapFrom(src => src.FullName))
              .ForMember(dest => dest.Status, opt => opt.MapFrom(src => "Active"))
              .ForMember(dest => dest.UpdatedAt, opt => opt.MapFrom(src => DateTime.UtcNow));
            CreateMap<UpdateConsultantDto, Consultant>()
              .ForMember(dest => dest.Degree, opt => opt.MapFrom(src => src.Degree))
                .ForMember(dest => dest.HourlyRate, opt => opt.MapFrom(src => src.HourlyRate))
                .ForMember(dest => dest.Specialty, opt => opt.MapFrom(src => src.Specialty))
                .ForMember(dest => dest.Experience, opt => opt.MapFrom(src => src.Experience))
                .ForMember(dest => dest.GoogleMeetLink, opt => opt.MapFrom(src => src.GoogleMeetLink))
                .ForMember(dest => dest.UpdatedAt, opt => opt.MapFrom(src => DateTime.UtcNow));
        }
    }
}