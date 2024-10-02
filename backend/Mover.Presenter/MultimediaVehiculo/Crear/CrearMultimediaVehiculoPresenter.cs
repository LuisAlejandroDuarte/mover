
using Mover.DTO.Multimedia;
using Mover.UseCasesPorts.Multimedia.Crear;

namespace Mover.Presenter.MultimediaVehiculo.Crear
{
    public class CrearMultimediaVehiculoPresenter : IMultimediaVehiculoOutPutPort, IPresenter<MultimediaVehiculoDTO?>
    {
        public MultimediaVehiculoDTO? Content { get; private set; }

        public Task Handle(MultimediaVehiculoDTO multimediaVehiculoDTO)
        {
           Content = multimediaVehiculoDTO;
            return Task.CompletedTask;
        }
    }
}
