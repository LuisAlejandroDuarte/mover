
using Mover.DTO.Vehiculos;
using Mover.UseCasesPorts.CondicionVehiculo;

namespace Mover.Presenter.CondicionVehiculo
{
    public class GetAllCondicionVehiculoPresenter : IGetAllCondicionVehiculoOutPutPort, IPresenter<List<CondicionVehiculoDTO>?>
    {
        public List<CondicionVehiculoDTO>? Content { get; private set; }

        public Task GetAllCondicionVehiculo(List<CondicionVehiculoDTO> listCondicionVehiculo)
        {
            Content =listCondicionVehiculo;
            return Task.CompletedTask;  
        }
    }
}
