
using Mover.DTO.Dispositivo;

namespace Mover.UseCasesPorts.Dispositivos.Crear
{
    public interface ICrearDispositivoInPutPort
    {
        Task Handle(DispositivoDTO dispositivoDTO);
    }
}
