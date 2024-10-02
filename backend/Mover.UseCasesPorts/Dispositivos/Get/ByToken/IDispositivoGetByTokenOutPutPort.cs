using Mover.DTO.Dispositivo;

namespace Mover.UseCasesPorts.Dispositivos.Get.ByToken
{
    public interface IDispositivoGetByTokenOutPutPort
    {
        Task GetDispositivo(DispositivoDTO dispositivo);   
    }
}
