namespace Mover.UseCasesPorts.ConductorAutorizado.Eliminar
{
    public interface IEliminarConductorInPutPort
    {
        Task Handle(int id);
    }
}
