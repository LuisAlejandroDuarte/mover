
using Mover.Entities.POCOEntities.Georeferencia;
using Mover.UseCasesPorts.Georeferencia.Departamento.Get.ByIdPais;

namespace Mover.Presenter.Georeferencia.Departamento.Get.ByIdPais
{
    public class GetDepartamentoByIdPaisPresenter : IGetDepartamentoByIdPaisOutPutPort, IPresenter<List<DepartamentoDTO>?>
    {
        public List<DepartamentoDTO>? Content { get;private  set; } 

        public Task GetDepartamentoByIdPais(List<DepartamentoDTO> listDepartamento)
        {
            Content =listDepartamento;

            return Task.CompletedTask;
        }
    }
}
