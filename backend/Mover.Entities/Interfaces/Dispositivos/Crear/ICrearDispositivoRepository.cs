using Mover.DTO.Dispositivo;


namespace Mover.Entities.Interfaces.Dispositivos.Crear
{
    public interface ICrearDispositivoRepository
    {
        Task<int?> Create(DispositivoDTO dispositivoDTO);

    }
}
