
using Mover.Entities.POCOEntities.Georeferencia;
using Mover.UseCasesPorts.Georeferencia.Ciudad.Get.ByIdDepartamento;

namespace Mover.Presenter.Georeferencia.Ciudad.Get.ByIDepartamento
{
    public class GetCiudadByIdDepartamentoPresenter : IGetCiudadByIdDepartamentoOutPutPort, IPresenter<List<CiudadDTO>?>
    {
        public List<CiudadDTO>? Content { get; private set; }

        public Task GetCiudadByIdDepartamento(List<CiudadDTO> listCiudad)
        {
            Content =listCiudad; 

            return Task.CompletedTask;
        }
    }
}
