using Mover.UseCasesPorts.ConductorAutorizado.Eliminar;

namespace Mover.Presenter.ConductorAutorizado.Eliminar
{
    public class EliminarConductorPresenter :IEliminarConductorOutPutPort,IPresenter<bool>
    {

        public bool Content { get;private  set; }

        public Task EliminarConductor(bool result)
        {
            Content = result;
            return Task.CompletedTask;
        }
    }
}
