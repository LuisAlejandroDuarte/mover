
using Mover.DTO.Vehiculos;

namespace Mover.Entities.Interfaces.Carroceria.Get.ByIdClase
{
    public interface IGetCarroceriaByIdClaseRepository
    {
        Task<List<CarroceriaDTO>> GetCarroceriaByIdClase(int idClase);       
    }
}
