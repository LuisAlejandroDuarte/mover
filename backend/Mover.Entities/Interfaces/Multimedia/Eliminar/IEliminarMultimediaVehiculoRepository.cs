namespace Mover.Entities.Interfaces.Multimedia.Eliminar
{
    public interface IEliminarMultimediaVehiculoRepository
    {
        Task<bool> Eliminar(int idMultimediaVehiculo);
    }
}
