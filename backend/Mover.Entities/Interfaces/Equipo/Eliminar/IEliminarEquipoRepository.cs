namespace Mover.Entities.Interfaces.Equipo.Eliminar
{
    public interface IEliminarEquipoRepository
    {
        Task<bool> EliminarEquipo(int Id);
    }
}
