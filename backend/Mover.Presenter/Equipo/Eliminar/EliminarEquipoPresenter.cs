using Mover.UseCasesPorts.Equipo.Eliminar;

namespace Mover.Presenter.Equipo.Eliminar
{
    public class EliminarEquipoPresenter : IEliminarEquipoOutPutPort,IPresenter<bool>
    {

        public bool Content { get;private  set; }

        public Task EliminarEquipo(bool result)
        {
            Content = result;
            return Task.CompletedTask;
        }
    }
}
