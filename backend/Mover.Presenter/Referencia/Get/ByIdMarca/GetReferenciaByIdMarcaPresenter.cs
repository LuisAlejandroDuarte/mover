
using Mover.DTO.Vehiculos;
using Mover.UseCasesPorts.Referencia.Get.ByIdMarca;

namespace Mover.Presenter.Referencia.Get.ByIdMarca
{
    public class GetReferenciaByIdMarcaPresenter : IGetReferenciaByIdMarcaOutPutPort, IPresenter<List<ReferenciaDTO>?>
    {
        public List<ReferenciaDTO>? Content { get; private set; }

        public Task GetReferenciaByIdMarca(List<ReferenciaDTO> listReferencia)
        {
            Content = listReferencia;

            return Task.CompletedTask;
        }
    }
}
