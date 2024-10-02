
using Mover.DTO.Vehiculos;

namespace Mover.Entities.Interfaces.Marca.Get.ByIdClase
{
    public interface IGetMarcaByIdClaseRepository
    {
        Task<List<MarcaDTO>> GetMarcaByIdClase(int idClase);
    }
}
