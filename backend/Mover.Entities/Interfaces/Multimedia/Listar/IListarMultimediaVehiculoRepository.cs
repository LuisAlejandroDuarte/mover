
using Mover.DTO.Multimedia;

namespace Mover.Entities.Interfaces.Multimedia.Listar
{
    public interface IListarMultimediaVehiculoRepository
    {
        Task<List<MultimediaVehiculoDTO>> ListaMultimediaVehciulo(int idVehiculo);
    }
}
