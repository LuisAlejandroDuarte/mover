

namespace Mover.UseCasesPorts.Vehiculo.Eliminar
{
    public interface IEliminarVehiculoInPutPort
    {
        Task Handle(int Id);
    }
}
