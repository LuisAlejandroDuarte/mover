

using Mover.Entities.POCOEntities.Georeferencia;

namespace Mover.Entities.Interfaces.Georeferencia.Ciudad.Get.ByIdDepartamento
{
    public interface IGetCiudadByIdDepartamentoRepository
    {
        Task<List<CiudadDTO>> GetCiudadByIdDepartamento(int departamentoId);

    }
}
