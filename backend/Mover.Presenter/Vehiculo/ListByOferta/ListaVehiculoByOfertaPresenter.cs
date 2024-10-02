using Mover.DTO.Vehiculos;
using Mover.UseCasesPorts.Vehiculo.ListByOferta;

namespace Mover.Presenter.Vehiculo.ListByOferta
{
    public class ListaVehiculoByOfertaPresenter : IListaVehiculoByOfertaOutPutPort, IPresenter<List<VehiculoDTO>?>
    {
        public List<VehiculoDTO>? Content { get; private set; }

        public Task GetListaVehiculoByOferta(List<VehiculoDTO> vehiculos)
        {
            Content = vehiculos;
            return Task.CompletedTask;
        }
    }
}
