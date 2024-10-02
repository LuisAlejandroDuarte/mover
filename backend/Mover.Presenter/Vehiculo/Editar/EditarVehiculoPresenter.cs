using Mover.UseCasesPorts.Vehiculo.Editar;

namespace Mover.Presenter.Vehiculo.Editar
{
    public class EditarVehiculoPresenter : IEditarVehiculoOutPutPort, IPresenter<bool>
    {
        public bool Content { get; private set; }

        public Task EditarOferta(bool result)
        {
            Content  =result;
            return Task.CompletedTask;
        }
    }
}
