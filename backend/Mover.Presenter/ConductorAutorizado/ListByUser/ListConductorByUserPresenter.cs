
using Mover.DTO.ConductorAutorizado;
using Mover.UseCasesPorts.ConductorAutorizado.ListaByUser;

namespace Mover.Presenter.ConductorAutorizado.ListByUser
{
    public class ListConductorByUserPresenter:IListaConductorByUserOutPutPort,IPresenter<List<ConductorAutorizadoDTO>?>
    {
        public List<ConductorAutorizadoDTO>? Content { get; private set; }

        public Task GetListaOfertaByUser(List<ConductorAutorizadoDTO> conductorAutorizadoDTOs)
        {
            Content = conductorAutorizadoDTOs;
            return Task.CompletedTask;
        }
    }
}
