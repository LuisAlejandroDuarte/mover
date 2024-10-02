using Mover.DTO.Vehiculos;
namespace Mover.Entities.Interfaces.CondicionVehiculo
{
    public interface IGetAllCondicionVehiculoRepository
    {
        Task<List<CondicionVehiculoDTO>> GetAllCondicionVehiculo();
    }
}
