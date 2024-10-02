using Mover.DTO.Equipo;
namespace Mover.UseCasesPorts.Equipo.ListaByUser
{
    public interface IListaEquipoByUserOutPutPort
    {
        Task GetListaOfertaByUser(List<EquipoDTO> equipoDTOs);
    }
}
