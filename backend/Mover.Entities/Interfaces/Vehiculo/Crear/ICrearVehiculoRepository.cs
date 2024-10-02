using Mover.DTO.Vehiculos;

namespace Mover.Entities.Interfaces.Vehiculo.Crear
{
    public interface ICrearVehiculoRepository
    {
        Task<int> CrearVehiculo(VehiculoDTO vehiculo);
    }
}
