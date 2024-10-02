using Mover.DTO.ConductorAutorizado;
namespace Mover.UseCasesPorts.ConductorAutorizado.ListaByUser
{
    public interface IListaConductorByUserOutPutPort
    {
        Task GetListaOfertaByUser(List<ConductorAutorizadoDTO> conductorAutorizadoDTOs);
    }
}
