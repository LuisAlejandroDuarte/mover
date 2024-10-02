using Mover.DTO.Vehiculos;
namespace Mover.UseCasesPorts.CondicionVehiculo
{
    public interface IGetAllCondicionVehiculoOutPutPort
    {
        Task GetAllCondicionVehiculo(List<CondicionVehiculoDTO> listCondicionVehiculo);
    }
}
