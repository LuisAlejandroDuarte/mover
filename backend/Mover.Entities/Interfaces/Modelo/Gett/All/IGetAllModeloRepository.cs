
using Mover.DTO.Vehiculos;

namespace Mover.Entities.Interfaces.Modelo.Gett.All
{
    public interface IGetAllModeloRepository
    {
        Task<List<ModeloDTO>> GetAllModelo();
    }
}
