

namespace Mover.UseCasesPorts.Dispositivos.Get.ByDeviceId
{
    public interface IDispositivoGetByDeviceIdInPutPort
    {
        Task Handle(string deviceId);
    }
}
