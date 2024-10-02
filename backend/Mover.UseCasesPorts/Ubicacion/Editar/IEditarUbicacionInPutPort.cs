

using Mover.DTO.Ubicaciones;

namespace Mover.UseCasesPorts.Ubicacion.Editar
{
    public interface IEditarUbicacionInPutPort
    {
        Task Handle(UbicacionDTO ubicacionDTO);
    }
}
