
using Mover.DTO.Vehiculos;
using Mover.UseCasesPorts.Clase.Get.ByIdCategoria;

namespace Mover.Presenter.Clase.Get.ByIdCategoria
{
    public class GetClaseByIdCategoriaPresenter : IGetClaseByIdCategoriaOutPutPort, IPresenter<List<ClaseDTO>?>
    {
        public List<ClaseDTO>? Content { get; private set; }

        public Task GetClaseByIdCategoria(List<ClaseDTO> listClase)
        {
            Content = listClase;
            return Task.CompletedTask;
        }
    }
}
