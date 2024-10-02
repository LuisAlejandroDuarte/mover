
using Mover.DTO.Vehiculos;
using Mover.UseCasesPorts.Modelo.Get.All;

namespace Mover.Presenter.Modelo.Get.All
{
    public class GetAllModeloPresenter : IGetAllModeloOutPutPort,IPresenter<List<ModeloDTO>?>
    {
        public List<ModeloDTO>? Content { get;private set; }

        public Task GetAllModelo(List<ModeloDTO> listModelo)
        {
            Content = listModelo;

            return Task.CompletedTask;
        }
    }
}
