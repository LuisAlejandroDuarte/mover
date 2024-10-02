
using Mover.DTO.Multimedia;

namespace Mover.Entities.Interfaces.Multimedia.Crear
{
    public interface ICrearMultimediaVehiculoRepository
    {
        Task<MultimediaVehiculoDTO> Create(MultimediaVehiculoDTO multimediaVehiculo);
    }
}
