using Mover.DTO.Ubicaciones;

namespace Mover.UseCasesPorts.Ubicacion.Crear
{
    public interface ICrearUbicacionInPutPort
    {
        Task Handle(UbicacionDTO ubicacion);
    }
}
