
using Mover.DTO.Dispositivo;

namespace Mover.Entities.Interfaces.Dispositivos.Get.ByDeviceId
{
    public interface IGetByDeviceIdDispositivoRepository
    {
        Task<DispositivoDTO> GetByDeviceIdDispositivo(string deviceId);
    }
}
