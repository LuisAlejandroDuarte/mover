using Mover.DTO.Multimedia;
using Mover.UseCasesPorts.Multimedia.Lista;

namespace Mover.Presenter.MultimediaVehiculo.Listar
{
    public class LisatrMultimediaVehiculoPresenter : IListaMultimediaVehiculoOutPutPort, IPresenter<List<MultimediaVehiculoDTO>?>
    {
        public List<MultimediaVehiculoDTO>? Content { get; private set; }

        public Task Handle(List<MultimediaVehiculoDTO> lista)
        {
            Content = lista;
            return Task.CompletedTask;
        }
    }
}
