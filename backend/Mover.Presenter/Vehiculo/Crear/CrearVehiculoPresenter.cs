


using Mover.UseCasesPorts.Vehiculo.Crear;

namespace Mover.Presenter.Vehiculo.Crear
{
    public class CrearVehiculoPresenter : ICrearVehiculoOutPutPort, IPresenter<int>
    {
        public int Content { get; private set; }

        public Task CrearVehiculo(int Id)
        {
            Content = Id;
            return Task.CompletedTask;
        }
    }
}
