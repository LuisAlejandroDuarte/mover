
using Mover.Entities.POCOEntities.Georeferencia;

namespace Mover.Entities.Interfaces.Georeferencia.Departamento.Get.ByIdPais
{
    public interface IGetDepartamentoByIdPaisRepository
    {
        Task<List<DepartamentoDTO>> GetDepartamentosByIdPais(int paisId);

    }
}
