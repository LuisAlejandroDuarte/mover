

using Mover.UseCasesPorts.Ubicacion.Editar;

namespace Mover.Presenter.Ubicacion.Editar
{
    public class EditarUbicacionPresenter : IEditarUbicacionOutPutPort, IPresenter<bool>
    {
        public bool Content { get; private set; }

        public Task EditarUbicacion(bool result)
        {
           Content =result;
           return Task.CompletedTask;
        }
    }
}
