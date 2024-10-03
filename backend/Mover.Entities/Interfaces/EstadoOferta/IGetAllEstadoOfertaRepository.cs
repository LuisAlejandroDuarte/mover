

using Mover.DTO.EstadoOferta;

namespace Mover.Entities.Interfaces.EstadoOferta
{
    public interface IGetAllEstadoOfertaRepository
    {
        Task<List<EstadoOfertaDTO>> GetAllEstadoOferta();
    }
}
