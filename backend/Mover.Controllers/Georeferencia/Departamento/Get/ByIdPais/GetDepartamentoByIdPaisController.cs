
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.Entities.POCOEntities.Georeferencia;
using Mover.Presenter;
using Mover.UseCasesPorts.Georeferencia.Departamento.Get.ByIdPais;
namespace Mover.Controllers.Georeferencia.Departamento.Get.ByIdPais
{
    [Route("api/[controller]")]
    [ApiController]
    public class GetDepartamentoByIdPaisController
    {
        readonly IGetDepartamentoByIdPaisInPutPort getDepartamentoByIdPaisInPutPort;
        readonly IGetDepartamentoByIdPaisOutPutPort getDepartamentoByIdPaisOutPutPort;

        public GetDepartamentoByIdPaisController(IGetDepartamentoByIdPaisInPutPort getDepartamentoByIdPaisInPutPort, IGetDepartamentoByIdPaisOutPutPort getDepartamentoByIdPaisOutPutPort)
        {
            this.getDepartamentoByIdPaisInPutPort = getDepartamentoByIdPaisInPutPort;
            this.getDepartamentoByIdPaisOutPutPort = getDepartamentoByIdPaisOutPutPort;
        }

        [HttpGet]
        [Authorize]
        public async Task<List<DepartamentoDTO>> GetDepartamentoByIdPais(int paisId)
        {
            await getDepartamentoByIdPaisInPutPort.Handle(paisId);

            return ((IPresenter<List<DepartamentoDTO>>)getDepartamentoByIdPaisOutPutPort).Content;
        }
    }
}
