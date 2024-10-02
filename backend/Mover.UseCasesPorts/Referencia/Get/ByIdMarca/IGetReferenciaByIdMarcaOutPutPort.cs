

using Mover.DTO.Vehiculos;

namespace Mover.UseCasesPorts.Referencia.Get.ByIdMarca
{
    public interface IGetReferenciaByIdMarcaOutPutPort
    {
        Task GetReferenciaByIdMarca(List<ReferenciaDTO> listReferencia);
    }
}
