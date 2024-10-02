using Mover.DTO.Oferta;
using Mover.UseCasesPorts.Oferta.ListaByUser;


namespace Mover.Presenter.Oferta.ListaByUser
{
    public class ListaOfertaByUserPresenter : IListaOfertaByUserOutPutPort, IPresenter<List<OfertaDTO>?>
    {
        public List<OfertaDTO>? Content { get; private set; } 

        public Task GetListaOfertaByUser(List<OfertaDTO> ofertas)
        {
            Content = ofertas;
            return Task.CompletedTask;
        }
    }
}
