using Mover.DTO.Vehiculos;
using Mover.UseCasesPorts.ParametrosVehiculo;

namespace Mover.Presenter.ParametrosVehiculo
{
    public class GetAllParametrosVehiculoPresenter : IGetAllParametrosVehiculoOutPutPort, IPresenter<List<ParametrosVehiculoDTO>?>
    {
        public List<ParametrosVehiculoDTO>? Content { get; private set; }

        public Task GetAllParametrosVehiculoOferta(List<ParametrosVehiculoDTO> listEstadoOferta)
        {
            Content = listEstadoOferta;
            return Task.CompletedTask;
        }
    }
}
