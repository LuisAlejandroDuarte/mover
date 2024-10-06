
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Georeferencia;
using Mover.Presenter;
using Mover.UseCasesPorts.Georeferencia.Pais.Get.ByCodigo;

namespace Mover.Controllers.Georeferencia.Pais.Get.ByCodigo
{


    [Route("api/[controller]")]
    [ApiController]
    public class GetPaisByCodigoController
    {
        readonly IGetPaisByCodigoInPutPort getPaisByCodigoInPutPort;
        readonly IGetPaisByCodigoOutPutPort getPaisByCodigoOutPutPort;

        public GetPaisByCodigoController(IGetPaisByCodigoInPutPort getPaisByCodigoInPutPort, IGetPaisByCodigoOutPutPort getPaisByCodigoOutPutPort)
        {
            this.getPaisByCodigoInPutPort = getPaisByCodigoInPutPort;
            this.getPaisByCodigoOutPutPort = getPaisByCodigoOutPutPort;
        }


        [HttpGet]
        [Authorize]
        public async Task<PaisDTO> GetPaisByCodigo(string codigo)
        {
            await getPaisByCodigoInPutPort.Handle(codigo);

            return ((IPresenter<PaisDTO>)getPaisByCodigoOutPutPort).Content;
        }
    }
}
