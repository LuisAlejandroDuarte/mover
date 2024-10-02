
using Mover.DTO.Vehiculos;

namespace Mover.UseCasesPorts.EstadoVehiculo
{
    public interface IGetAllEstadoVehiculoOutPutPort
    {
        Task GetAllEstadoVehiculo(List<EstadoVehiculoDTO> listEstadoVehiculo);
    }
}
