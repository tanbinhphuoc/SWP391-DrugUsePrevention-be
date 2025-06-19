using AutoMapper;
using DrugUsePreventionAPI.Models.DTOs.Survey;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Mappings 
{
    public class SurveyMappingProfile : Profile 
    {
        public SurveyMappingProfile() 
        { 
            CreateMap<Survey, CreateSurveyDto>().ReverseMap();
        } 
    } 
}