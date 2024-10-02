using Mover.DTO.Oferta;


namespace Mover.Entities.Interfaces.Oferta.ListaByUser
{
    public interface IListaOfertaByUserRepository
    {
        Task<List<OfertaDTO>> GetListaOfertaByUser(int IdUSer);
    }
}
