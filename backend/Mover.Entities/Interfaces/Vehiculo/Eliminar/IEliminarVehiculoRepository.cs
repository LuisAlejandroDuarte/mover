

namespace Mover.Entities.Interfaces.Vehiculo.Eliminar
{
    public interface IEliminarVehiculoRepository
    {
        Task<bool> EliminarVehiculo(int id);
    }
}
