
using Mover.DTO.Georeferencia;
using Mover.UseCasesPorts.Georeferencia.Pais.Get.ByCodigo;

namespace Mover.Presenter.Georeferencia.Pais.Get.ByCoidgo
{
    public class GetPaisByCodigoPresenter : IGetPaisByCodigoOutPutPort, IPresenter<PaisDTO?>
    {
        public PaisDTO? Content { get; private set; }

        public Task GetPaisByIdCodigo(PaisDTO paisDTO)
        {
            Content = paisDTO;

            return Task.CompletedTask;
        }
    }
}
