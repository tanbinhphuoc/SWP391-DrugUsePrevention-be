using AutoMapper;
using DrugUsePreventionAPI.Models.DTOs.User;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Mappings 
{ 
    public class UserMappingProfile : Profile 
    {
        public UserMappingProfile() 
        {
            CreateMap<User, UserDto>().ForMember(dest => dest.RoleName, opt => opt.MapFrom(src => src.Role.RoleName));            CreateMap<CreateUserDto, User>();
            CreateMap<UpdateUserDto, User>();
            CreateMap<CreateUserByAdminDto, User>(); 
        }
    }
}