using AutoMapper;
using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Mappings
{
    public class AppointmentMappingProfile : Profile
    {
        public AppointmentMappingProfile()
        {
            CreateMap<Appointment, AppointmentDto>()
                .ForMember(dest => dest.ConsultantName, opt => opt.MapFrom(src => src.Consultant != null && src.Consultant.User != null ? src.Consultant.User.FullName : null))
                .ForMember(dest => dest.MemberName, opt => opt.MapFrom(src => src.User != null ? src.User.FullName : null));
            CreateMap<BookAppointmentDto, Appointment>();
            CreateMap<Consultant, ConsultantDto>();
            CreateMap<ConsultantSchedule, ConsultantScheduleDto>();
        }
    }
}