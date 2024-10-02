

using Mover.DTO.Vehiculos;

namespace Mover.Entities.Interfaces.Referencia.Get.ByIdMarca
{
    public interface IGetReferenciaByIdMarcaRepository
    {
        Task<List<ReferenciaDTO>> GetReferenciaByIdMarca(int idMarca);
    }
}
