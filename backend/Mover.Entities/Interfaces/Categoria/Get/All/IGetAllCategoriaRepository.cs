
using Mover.DTO.Vehiculos;

namespace Mover.Entities.Interfaces.Categoria.Get.All
{
    public interface IGetAllCategoriaRepository
    {
        Task<List<CategoriaDTO>> GetAllCategoria();
    }
}
