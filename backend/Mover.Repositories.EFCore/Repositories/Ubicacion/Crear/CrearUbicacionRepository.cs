
using AutoMapper;
using Mover.DTO.Ubicaciones;
using Mover.Entities.Interfaces.Ubicacion.Crear;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Ubicacion.Crear
{
    public class CrearUbicacionRepository:ICrearUbicacionRepository
    {
        readonly MoverContext moverContext;
        readonly IMapper mapper;

        public CrearUbicacionRepository(MoverContext moverContext, IMapper mapper)
        {
            this.moverContext = moverContext;
            this.mapper = mapper;
        }

        public async Task<int> CrearUbicacion(UbicacionDTO ubicacionDTO)
        {
            try
            {             
                var nuevaUbicacion = mapper.Map<Mover.Entities.POCOEntities.Ubicacion>(ubicacionDTO);             
                await moverContext.Ubicacion.AddAsync(nuevaUbicacion);             
                await moverContext.SaveChangesAsync();             
                return nuevaUbicacion.Id;
            }
            catch (Exception e)
            {             
                throw new Exception($"{e.Message}, error al crear la ubicación con Id {ubicacionDTO.Direccion}");
            }
        }

    }
}
