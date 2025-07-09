using AutoMapper;
using DrugUsePreventionAPI.Models.DTOs.Appointment;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Configurations
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<Appointment, AppointmentHistoryDto>()
                .ForMember(dest => dest.AppointmentId, opt => opt.MapFrom(src => src.AppointmentID))
                .ForMember(dest => dest.AppointmentStartDateTime, opt => opt.MapFrom(src => src.StartDateTime))
                .ForMember(dest => dest.AppointmentEndDateTime, opt => opt.MapFrom(src => src.EndDateTime))
                .ForMember(dest => dest.Status, opt => opt.MapFrom(src => src.Status))
                .ForMember(dest => dest.Price, opt => opt.MapFrom(src => src.Price))
                .ForMember(dest => dest.ConsultantName, opt => opt.MapFrom(src => src.Consultant.User.FullName));

            CreateMap<Payment, PaymentHistoryDto>()
                .ForMember(dest => dest.PaymentId, opt => opt.MapFrom(src => src.PaymentID))
                .ForMember(dest => dest.AppointmentId, opt => opt.MapFrom(src => src.AppointmentID))
                .ForMember(dest => dest.Amount, opt => opt.MapFrom(src => src.Amount))
                .ForMember(dest => dest.Status, opt => opt.MapFrom(src => src.Status))
                .ForMember(dest => dest.TransactionId, opt => opt.MapFrom(src => src.TransactionID))
                .ForMember(dest => dest.PaymentDate, opt => opt.MapFrom(src => src.PaymentDate))
                .ForMember(dest => dest.ConsultantName, opt => opt.MapFrom(src => src.Appointment.Consultant.User.FullName))
                .ForMember(dest => dest.AppointmentStartDateTime, opt => opt.MapFrom(src => src.Appointment.StartDateTime))
                .ForMember(dest => dest.AppointmentEndDateTime, opt => opt.MapFrom(src => src.Appointment.EndDateTime))
                .ForMember(dest => dest.PaymentMethod, opt => opt.MapFrom(src => src.PaymentMethod));


           
        }
    }
}