
using Mover.DTO.Vehiculos;
using Mover.UseCasesPorts.EstadoVehiculo;

namespace Mover.Presenter.EstadoVehiculo
{
    public class GetAllEstadoVehiculoPresenter : IGetAllEstadoVehiculoOutPutPort, IPresenter<List<EstadoVehiculoDTO>?>
    {
        public List<EstadoVehiculoDTO>? Content { get; private set; }    

        public Task GetAllEstadoVehiculo(List<EstadoVehiculoDTO> listEstadoVehiculo)
        {
            Content = listEstadoVehiculo;
            return Task.CompletedTask;
        }
    }
}
