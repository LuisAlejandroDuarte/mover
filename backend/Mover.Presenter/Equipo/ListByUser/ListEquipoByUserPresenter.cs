
using Mover.DTO.Equipo;
using Mover.UseCasesPorts.Equipo.ListaByUser;

namespace Mover.Presenter.Equipo.ListByUser
{
    public class ListEquipoByUserPresenter : IListaEquipoByUserOutPutPort,IPresenter<List<EquipoDTO>?>
    {
        public List<EquipoDTO>? Content { get; private set; }

        public Task GetListaOfertaByUser(List<EquipoDTO> equipoDTOs)
        {
            Content = equipoDTOs;
            return Task.CompletedTask;
        }
    }
}
