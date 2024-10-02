using Mover.UseCasesPorts.Multimedia.Eliminar;

namespace Mover.Presenter.MultimediaVehiculo.Eliminar
{
    public class EliminarMultimediaVehiculoPresenter : IEliminarMultimediaVehiculoOutPutPort, IPresenter<bool>
    {
        public bool Content { get; private set; }

        public Task Handle(bool result)
        {
            Content = result;
            return Task.CompletedTask;
        }
    }
}
