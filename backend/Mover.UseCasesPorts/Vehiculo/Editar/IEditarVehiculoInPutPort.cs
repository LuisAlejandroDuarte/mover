

using Mover.DTO.Vehiculos;

namespace Mover.UseCasesPorts.Vehiculo.Editar
{
    public interface IEditarVehiculoInPutPort
    {
        Task Handle(VehiculoDTO vehiculo);
    }
}
