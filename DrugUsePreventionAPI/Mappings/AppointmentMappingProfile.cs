using AutoMapper;
using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Mappings
{ 
    public class AppointmentMappingProfile : Profile
    {
        public AppointmentMappingProfile() 
        {
            CreateMap<Appointment, AppointmentDto>();
            CreateMap<BookAppointmentDto, Appointment>();
            CreateMap<Consultant, ConsultantDto>();
            CreateMap<ConsultantSchedule, ConsultantScheduleDto>();
        }
    }
}