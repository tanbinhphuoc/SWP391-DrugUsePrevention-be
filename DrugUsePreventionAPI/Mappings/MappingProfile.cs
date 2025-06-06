using AutoMapper;
using DrugUsePreventionAPI.Models.DTOs.Auth;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Models.DTOs.Appointment;

namespace DrugUsePreventionAPI.Mappings
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            // User mappings
            CreateMap<User, UserDto>()
                .ForMember(dest => dest.RoleName, opt => opt.MapFrom(src => src.Role != null ? src.Role.RoleName : string.Empty));
            CreateMap<CreateUserDto, User>();
            CreateMap<UpdateUserDto, User>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));
            CreateMap<RegisterDto, User>();

            // Appointment mappings
            CreateMap<Appointment, AppointmentDto>()
                .ForMember(dest => dest.ConsultantName, opt => opt.MapFrom(src => src.Consultant != null && src.Consultant.User != null ? src.Consultant.User.FullName : string.Empty))
                .ForMember(dest => dest.MemberName, opt => opt.MapFrom(src => src.User != null ? src.User.FullName : string.Empty));
            CreateMap<Consultant, ConsultantDto>()
                .ForMember(dest => dest.FullName, opt => opt.MapFrom(src => src.User != null ? src.User.FullName : string.Empty))
                .ForMember(dest => dest.Email, opt => opt.MapFrom(src => src.User != null ? src.User.Email : string.Empty))
                .ForMember(dest => dest.CertificateName, opt => opt.MapFrom(src => src.Certificate != null ? src.Certificate.CertificateName : string.Empty));
            CreateMap<ConsultantSchedule, ConsultantScheduleDto>();
        }
    }
}