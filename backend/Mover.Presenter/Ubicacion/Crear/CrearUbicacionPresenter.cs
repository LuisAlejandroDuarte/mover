

using Mover.UseCasesPorts.Ubicacion.Crear;

namespace Mover.Presenter.Ubicacion.Crear
{
    public class CrearUbicacionPresenter : ICrearUbicacionOutPutPort, IPresenter<int>
    {
        public int Content { get; private set; }

        public Task CrearUbicacion(int id)
        {
            Content = id;
            return Task.CompletedTask;
        }
    }
}
