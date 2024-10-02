using Mover.DTO.TipoIdentificacion;

namespace Mover.Entities.Interfaces.TipoIdentificacion.Listar
{
    public interface IListarTipoIdentificacionRepository
    {
        Task<List<TipoIdentificacionDTO>> GetTipoIdentificacion();

    }
}
