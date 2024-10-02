using Mover.UseCasesPorts.ConductorAutorizado.Crear;

namespace Mover.Presenter.ConductorAutorizado.Crear
{
    public class CrearConductorPresenter:ICrearConductorOutPutPort,IPresenter<int>
    {
        public int Content { get; private set; }

        public Task CrearConductor(int Id)
        {
            Content = Id;
            return Task.CompletedTask;
        }
    }
}
