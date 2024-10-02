
using Mover.DTO.Dispositivo;
using Mover.UseCasesPorts.Dispositivos.Get.ByDeviceId;

namespace Mover.Presenter.Dispositivo.Get.ByDeviceId
{
    public class GetByDeviceIdDispositivoPresenter : IDispositivoGetByDeviceIdOutPutPort, IPresenter<DispositivoDTO?>
    {

        public DispositivoDTO? Content { get; private set; }

        public Task GetDispositivo(DispositivoDTO dispositivo)
        {
            Content = dispositivo;
            return Task.CompletedTask;
        }
    }
}
