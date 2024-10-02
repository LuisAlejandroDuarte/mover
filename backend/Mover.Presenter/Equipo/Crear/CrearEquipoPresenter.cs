

using Mover.UseCasesPorts.Equipo.Crear;

namespace Mover.Presenter.Equipo.Crear
{
    public class CrearEquipoPresenter:ICrearEquipoOutPutPort,IPresenter<int>
    {
        public int Content { get; private set; }

        public Task CrearEquipo(int Id)
        {
            Content = Id;
            return Task.CompletedTask;
        }
    }
}
