
using Mover.DTO.EstadoOferta;

namespace Mover.UseCasesPorts.EstadoOferta
{
    public interface IGetAllEstadoOfertaOutPutPort
    {
        Task GetAllEstadoOferta(List<EstadoOfertaDTO> listEstadoOferta);

    }
}
