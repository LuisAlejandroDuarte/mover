
using Mover.DTO.Vehiculos;

namespace Mover.UseCasesPorts.Categoria.Get.All
{
    public interface IGetAllCategoriaOutPutPort
    {
        Task GetAllCategoria(List<CategoriaDTO> listCategoria);
    }
}
