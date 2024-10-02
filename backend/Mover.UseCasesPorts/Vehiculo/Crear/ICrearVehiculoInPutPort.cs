
using Mover.DTO.Vehiculos;

namespace Mover.UseCasesPorts.Vehiculo.Crear
{
    public interface ICrearVehiculoInPutPort
    {
        Task Handle(VehiculoDTO vehiculo);
    }
}
