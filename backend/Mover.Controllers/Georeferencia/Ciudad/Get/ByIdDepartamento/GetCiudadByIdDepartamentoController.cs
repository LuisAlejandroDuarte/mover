


using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.Entities.POCOEntities.Georeferencia;
using Mover.Presenter;
using Mover.UseCasesPorts.Georeferencia.Ciudad.Get.ByIdDepartamento;

namespace Mover.Controllers.Georeferencia.Ciudad.Get.ByIdDepartamento
{

    [Route("api/[controller]")]
    [ApiController]
    public class GetCiudadByIdDepartamentoController
    {

        readonly IGetCiudadByIdDepartamentoInPutPort getCiudadByIdDepartamentoInPutPort;
        readonly IGetCiudadByIdDepartamentoOutPutPort getCiudadByIdDepartamentoOutPutPort;

        public GetCiudadByIdDepartamentoController(IGetCiudadByIdDepartamentoInPutPort getCiudadByIdDepartamentoInPutPort, IGetCiudadByIdDepartamentoOutPutPort getCiudadByIdDepartamentoOutPutPort)
        {
            this.getCiudadByIdDepartamentoInPutPort = getCiudadByIdDepartamentoInPutPort;
            this.getCiudadByIdDepartamentoOutPutPort = getCiudadByIdDepartamentoOutPutPort;
        }

        [HttpGet]
        [Authorize]
        public async Task<List<DepartamentoDTO>> GetCiudadByIdDepartamento(int departamentoId)
        {
            await getCiudadByIdDepartamentoInPutPort.Handle(departamentoId);

            return ((IPresenter<List<DepartamentoDTO>>)getCiudadByIdDepartamentoOutPutPort).Content;
        }
    }
}
