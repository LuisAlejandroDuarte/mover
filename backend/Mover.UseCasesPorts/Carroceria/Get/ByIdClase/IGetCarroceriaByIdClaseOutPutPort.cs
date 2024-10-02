
using Mover.DTO.Vehiculos;

namespace Mover.UseCasesPorts.Carroceria.Get.ByIdClase
{
    public interface IGetCarroceriaByIdClaseOutPutPort
    {
        Task GetCarroceriaByIdClase(List<CarroceriaDTO> listCarroceria);
    }
}
