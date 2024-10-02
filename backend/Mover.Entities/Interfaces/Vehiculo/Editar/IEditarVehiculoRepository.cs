using Mover.DTO.Vehiculos;


namespace Mover.Entities.Interfaces.Vehiculo.Editar
{
    public interface IEditarVehiculoRepository
    {
        Task<bool> EditarVehiculo(VehiculoDTO vehiculo);
    }
}
