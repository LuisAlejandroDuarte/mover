
using Mover.DTO.Dispositivo;
using Mover.UseCasesPorts.Dispositivos.Crear;

namespace Mover.Presenter.Dispositivo.Crear
{
    public class CrearDispositivoPresenter : ICrearDispositivoOutPutPort, IPresenter<DispositivoDTO?>
    {
        public DispositivoDTO? Content { get; private set; }

        public Task Handle(DispositivoDTO? dispositivo)
        {
            Content = dispositivo;
            return Task.CompletedTask;
        }
    }
}
