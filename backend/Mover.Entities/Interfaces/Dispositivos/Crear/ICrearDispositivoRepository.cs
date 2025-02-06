using Mover.DTO.Dispositivo;


namespace Mover.Entities.Interfaces.Dispositivos.Crear
{
    public interface ICrearDispositivoRepository
    {
        Task<DispositivoDTO> Create(DispositivoDTO dispositivoDTO);

    }
}
