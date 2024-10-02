using Mover.DTO.Dispositivo;

namespace Mover.Entities.Interfaces.Dispositivos.Get.ByToken
{
    public interface IGetByTokenDispositivoRepository
    {
        Task<DispositivoDTO> GetDispositivoByToken(string token);
    }
}
