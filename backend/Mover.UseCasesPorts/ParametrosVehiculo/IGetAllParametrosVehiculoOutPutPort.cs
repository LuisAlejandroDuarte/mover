


using Mover.DTO.Vehiculos;

namespace Mover.UseCasesPorts.ParametrosVehiculo
{
    public interface IGetAllParametrosVehiculoOutPutPort
    {

        Task GetAllParametrosVehiculoOferta(List<ParametrosVehiculoDTO> listEstadoOferta);
    }
}
