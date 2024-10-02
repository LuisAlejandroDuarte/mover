
using Mover.UseCasesPorts.ConductorAutorizado.Editar;

namespace Mover.Presenter.ConductorAutorizado.Editar
{
    public class EditarConductorPresenter : IEditarConductorOutPutPort,IPresenter<bool>
    {
        public bool Content { get; private set; }

        public Task EditarConductor(bool result)
        {
            Content = result;
            return Task.CompletedTask;
        }
    }
}
