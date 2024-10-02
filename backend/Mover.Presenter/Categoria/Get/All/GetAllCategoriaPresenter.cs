

using Mover.DTO.Vehiculos;
using Mover.UseCasesPorts.Categoria.Get.All;

namespace Mover.Presenter.Categoria.Get.All
{
    public class GetAllCategoriaPresenter : IGetAllCategoriaOutPutPort, IPresenter<List<CategoriaDTO>?>
    {
        public List<CategoriaDTO>? Content { get; private set; }

        public Task GetAllCategoria(List<CategoriaDTO> listCategoria)
        {
            Content = listCategoria;
            return Task.CompletedTask;
        }
    }
}
