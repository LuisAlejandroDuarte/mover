using Mover.DTO.Dispositivo;

namespace Mover.UseCasesPorts.Dispositivos.Crear
{
    public interface ICrearDispositivoOutPutPort
    {
        Task Handle(DispositivoDTO? id);
    }
}
