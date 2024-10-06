
using Mover.Entities.POCOEntities.Georeferencia;

namespace Mover.UseCasesPorts.Georeferencia.Departamento.Get.ByIdPais
{
    public interface IGetDepartamentoByIdPaisOutPutPort
    {
        Task GetDepartamentoByIdPais(List<DepartamentoDTO> listDepartamento);
    }
}
