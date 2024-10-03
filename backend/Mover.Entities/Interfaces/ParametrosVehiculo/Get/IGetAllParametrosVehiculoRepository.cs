
using Mover.DTO.Vehiculos;

namespace Mover.Entities.Interfaces.ParametrosVehiculo.Get
{
    public interface IGetAllParametrosVehiculoRepository
    {

        Task<List<ParametrosVehiculoDTO>> GetAllParametrosVehiculo();

    }
}
