using Mover.UseCasesPorts.Vehiculo.Eliminar;

namespace Mover.Presenter.Vehiculo.Eliminar
{
    public class EliminarVehiculoPresenter : IEliminarVehiculoOutPutPort, IPresenter<bool>
    {
        public bool Content { get; private set; }

        public Task EliminarVehiculo(bool result)
        {
            Content= result;
            return Task.CompletedTask;
        }
    }
}
