
using Mover.DTO.Multimedia;

namespace Mover.UseCasesPorts.Multimedia.Lista
{
    public interface IListaMultimediaVehiculoOutPutPort
    {
        Task Handle(List<MultimediaVehiculoDTO> lista);
    }
}
