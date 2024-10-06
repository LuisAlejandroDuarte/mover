
using Mover.DTO.Georeferencia;

namespace Mover.UseCasesPorts.Georeferencia.Pais.Get.ByCodigo
{
    public interface IGetPaisByCodigoOutPutPort
    {

        Task GetPaisByIdCodigo(PaisDTO paisDTO);
    }
}
