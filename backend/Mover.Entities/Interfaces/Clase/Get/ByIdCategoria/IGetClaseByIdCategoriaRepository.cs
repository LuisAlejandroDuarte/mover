using Mover.DTO.Vehiculos;

namespace Mover.Entities.Interfaces.Clase.Get.ByIdCategoria
{
    public interface IGetClaseByIdCategoriaRepository
    {
        Task<List<ClaseDTO>> GetClaseByIdCategoria(int idCategoria);   
    }
}
