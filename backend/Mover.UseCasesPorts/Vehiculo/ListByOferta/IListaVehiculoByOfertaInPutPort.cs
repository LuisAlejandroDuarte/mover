

namespace Mover.UseCasesPorts.Vehiculo.ListByOferta
{
    public interface IListaVehiculoByOfertaInPutPort
    {
        Task Handle(int IdOferta);
    }
}
