using AutoMapper;
using Mover.DTO.Equipo;
using Mover.DTO.Multimedia;
using Mover.DTO.Oferta;
using Mover.DTO.Titulos;
using Mover.DTO.TipoIdentificacion;
using Mover.Entities.POCOEntities;
using Mover.DTO.Dispositivo;
using Mover.DTO.User;
using Mover.Entities.POCOEntities.Vehiculos;
using Mover.DTO.Vehiculos;
using Mover.DTO.Ubicaciones;
using Mover.DTO.EstadoOferta;
using Mover.DTO.ZonaTransporter;
using Mover.Entities.POCOEntities.Georeferencia;
using Mover.DTO.Georeferencia;

namespace Mover.Repositories.EFCore.Mapperconfig
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            #region Georefencia
            #region Pais
            CreateMap<Pais, PaisDTO>().ReverseMap();
            #endregion

            #region Departamento
            CreateMap<Departamento, DepartamentoDTO>().ReverseMap();
            #endregion

            #region Ciudad
            CreateMap<Ciudad, CiudadDTO>().ReverseMap();
            #endregion

            #endregion


            CreateMap<Oferta, OfertaDTO>().ReverseMap();
            CreateMap<Ubicacion, UbicacionDTO>().ReverseMap();
            CreateMap<User, UserDTO>().ReverseMap();
            CreateMap<Equipo, EquipoDTO>().ReverseMap();
            CreateMap<Categoria, CategoriaDTO>().ReverseMap();
            CreateMap<Clase, ClaseDTO>().ReverseMap();
            CreateMap<Carroceria, CarroceriaDTO>().ReverseMap();
            CreateMap<Marca, MarcaDTO>().ReverseMap();
            CreateMap<CondicionVehiculo, CondicionVehiculoDTO>().ReverseMap();
            CreateMap<EstadoVehiculo, EstadoVehiculoDTO>().ReverseMap();
            CreateMap<EstadoOferta, EstadoOfertaDTO>().ReverseMap();
            CreateMap<ZonaTransporter, ZonaTransporterDTO>().ReverseMap();
            CreateMap<ParametrosVehiculo, ParametrosVehiculoDTO>().ReverseMap();
            CreateMap<Referencia, ReferenciaDTO>().ReverseMap();
            CreateMap<Modelo, ModeloDTO>().ReverseMap();
            CreateMap<Titulos, TitulosDTO>().ReverseMap();
            CreateMap<TipoIdentificacion, TipoIdentificacionDTO>().ReverseMap();
            CreateMap<Dispositivos, DispositivoDTO>()
                .ForMember(dest => dest.UserId, opt => opt.MapFrom(src => src.UserId))
                .ReverseMap()
                .ForMember(dest => dest.UserId, opt => opt.MapFrom(src => src.UserId))
                .ReverseMap();
            CreateMap<MultimediaVehiculo, MultimediaVehiculoDTO>().ReverseMap().ForSourceMember(x=>x.Image,y=>y.DoNotValidate());
            
        }
    }
}
