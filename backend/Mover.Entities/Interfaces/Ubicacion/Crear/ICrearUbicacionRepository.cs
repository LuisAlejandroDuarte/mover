


using Mover.DTO.Ubicaciones;

namespace Mover.Entities.Interfaces.Ubicacion.Crear
{
    public interface ICrearUbicacionRepository
    {
        Task<int> CrearUbicacion(UbicacionDTO ubicacion);
    }
}
