using Mover.DTO.Dispositivo;
using Mover.UseCasesPorts.Dispositivos.Get.ByToken;

namespace Mover.Presenter.Dispositivo.Get.ByToken
{
    public class GetByTokenDispositivoPresenter : IDispositivoGetByTokenOutPutPort, IPresenter<DispositivoDTO?>
    {
        public DispositivoDTO? Content { get; private set; }

        public Task GetDispositivo(DispositivoDTO dispositivo)
        {
            Content =dispositivo;
            return Task.CompletedTask;
        }
    }
}
