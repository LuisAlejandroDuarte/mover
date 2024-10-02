
using Mover.UseCasesPorts.Dispositivos.Crear;

namespace Mover.Presenter.Dispositivo.Crear
{
    public class CrearDispositivoPresenter : ICrearDispositivoOutPutPort, IPresenter<int?>
    {
        public int? Content { get; private set; }

        public Task Handle(int? id)
        {
            Content = id;
            return Task.CompletedTask;
        }
    }
}
