using Mover.DTO.Vehiculos;
namespace Mover.Entities.Interfaces.EstadoVehiculo
{
    public interface IGetAllEstadoVehiculoRepository
    {
        Task<List<EstadoVehiculoDTO>> GetAllEstadoVehiculo();
    }
}
