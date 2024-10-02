
using Mover.DTO.Ubicaciones;

namespace Mover.Entities.Interfaces.Ubicacion.Editar
{
    public interface IEditarUbicacionRepository
    {
        Task<bool> EditarUbicacion(UbicacionDTO ubicacion);
    }
}
