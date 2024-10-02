
using Mover.UseCasesPorts.Equipo.Editar;

namespace Mover.Presenter.Equipo.Editar
{
    public class EditarEquipoPresenter : IEditarEquipoOutPutPort,IPresenter<bool>
    {
        public bool Content { get; private set; }

        public Task EditarEquipo(bool result)
        {
            Content = result;
            return Task.CompletedTask;
        }
    }
}
