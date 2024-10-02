
using Mover.DTO.Dispositivo;

namespace Mover.UseCasesPorts.Dispositivos.Get.ByDeviceId
{
    public interface IDispositivoGetByDeviceIdOutPutPort
    {
        Task GetDispositivo(DispositivoDTO dispositivo);
    }
}
