

using Mover.DTO.Multimedia;

namespace Mover.UseCasesPorts.Multimedia.Crear
{
    public interface IMultimediaVehiculoInPutPort
    {
        Task Handle(MultimediaVehiculoDTO  multimediaVehiculoDTO);
    }
}
