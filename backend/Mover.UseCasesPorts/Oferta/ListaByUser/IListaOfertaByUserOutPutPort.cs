using Mover.DTO.Oferta;
namespace Mover.UseCasesPorts.Oferta.ListaByUser
{
    public interface IListaOfertaByUserOutPutPort
    {
        Task GetListaOfertaByUser(List<OfertaDTO> ofertas);
    }
}
