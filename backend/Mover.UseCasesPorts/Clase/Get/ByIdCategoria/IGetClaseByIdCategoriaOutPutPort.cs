
using Mover.DTO.Vehiculos;

namespace Mover.UseCasesPorts.Clase.Get.ByIdCategoria
{
    public interface IGetClaseByIdCategoriaOutPutPort
    {
        Task GetClaseByIdCategoria(List<ClaseDTO> listClase);
    }
}
