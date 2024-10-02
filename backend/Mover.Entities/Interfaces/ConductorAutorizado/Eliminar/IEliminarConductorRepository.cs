namespace Mover.Entities.Interfaces.ConductorAutorizado.Eliminar
{
    public interface IEliminarConductorRepository
    {
        Task<bool> EliminarConductor(int Id);
    }
}
