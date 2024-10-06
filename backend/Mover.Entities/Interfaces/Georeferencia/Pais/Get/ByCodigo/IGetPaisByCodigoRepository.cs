
using Mover.DTO.Georeferencia;

namespace Mover.Entities.Interfaces.Georeferencia.Pais.Get.ByCodigo
{
    public interface IGetPaisByCodigoRepository
    {
        Task<PaisDTO> GetPaisByCodigo(string codigo);
    }
}
