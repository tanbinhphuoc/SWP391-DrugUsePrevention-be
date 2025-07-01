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
            CreateMap<Consultant, ConsultantDto>()
    .ForMember(dest => dest.FullName, opt => opt.MapFrom(src => src.User != null ? src.User.FullName : "N/A"))  // Kiểm tra User != null
    .ForMember(dest => dest.Email, opt => opt.MapFrom(src => src.User != null ? src.User.Email : "N/A"))  // Kiểm tra User != null
    .ForMember(dest => dest.Specialty, opt => opt.MapFrom(src => src.Specialty))
    .ForMember(dest => dest.Degree, opt => opt.MapFrom(src => src.Degree))
    .ForMember(dest => dest.HourlyRate, opt => opt.MapFrom(src => src.HourlyRate))
    .ForMember(dest => dest.CertificateName, opt => opt.MapFrom(src => src.Certificate != null ? src.Certificate.CertificateName : "N/A"))  // Kiểm tra Certificate != null
    .ForMember(dest => dest.GoogleMeetLink, opt => opt.MapFrom(src => src.GoogleMeetLink));

            CreateMap<ConsultantSchedule, ConsultantScheduleDto>();
            CreateMap<Payment, PaymentDto>()
               .ForMember(dest => dest.PaymentId, opt => opt.MapFrom(src => src.PaymentID))
               .ForMember(dest => dest.AppointmentId, opt => opt.MapFrom(src => src.AppointmentID))
               .ForMember(dest => dest.ConsultantName, opt => opt.MapFrom(src => src.Appointment != null && src.Appointment.Consultant != null && src.Appointment.Consultant.User != null ? src.Appointment.Consultant.User.FullName : null))
               .ForMember(dest => dest.AppointmentStartDateTime, opt => opt.MapFrom(src => src.Appointment != null ? src.Appointment.StartDateTime : (DateTime?)null))
               .ForMember(dest => dest.AppointmentEndDateTime, opt => opt.MapFrom(src => src.Appointment != null ? src.Appointment.EndDateTime : (DateTime?)null));


        }
    }
}