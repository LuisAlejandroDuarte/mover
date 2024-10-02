namespace Mover.UseCasesPorts.Equipo.Eliminar
{
    public interface IEliminarEquipoInPutPort
    {
        Task Handle(int id);
    }
}
