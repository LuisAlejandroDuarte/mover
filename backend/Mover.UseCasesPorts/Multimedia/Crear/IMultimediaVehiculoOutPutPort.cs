
using Mover.DTO.Multimedia;

namespace Mover.UseCasesPorts.Multimedia.Crear
{
    public interface IMultimediaVehiculoOutPutPort
    {
        Task Handle(MultimediaVehiculoDTO multimediaVehiculoDTO);
    }
}
