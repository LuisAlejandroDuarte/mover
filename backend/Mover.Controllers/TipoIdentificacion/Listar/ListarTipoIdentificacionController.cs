
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.TipoIdentificacion;
using Mover.Presenter;
using Mover.UseCasesPorts.TipoIdentificacion.Listar;

namespace Mover.Controllers.TipoIdentificacion.Listar
{

    [Route("api/[controller]")]
    [ApiController]
    public class ListarTipoIdentificacionController
    {
        private readonly ITipoIdentificaionInPutPort  tipoIdentificaionInPutPort;
        private readonly ITipoIdentificaionOutPutPort  tipoIdentificaionOutPutPort;

        public ListarTipoIdentificacionController(ITipoIdentificaionInPutPort tipoIdentificaionInPutPort, ITipoIdentificaionOutPutPort tipoIdentificaionOutPutPort)
        {
            this.tipoIdentificaionInPutPort = tipoIdentificaionInPutPort;
            this.tipoIdentificaionOutPutPort = tipoIdentificaionOutPutPort;
        }

        [HttpGet]
        [Authorize]
        public async Task<List<TipoIdentificacionDTO>> GetTipoIdentificacion()
        {
            await tipoIdentificaionInPutPort.Handle();

            var result = ((IPresenter<List<TipoIdentificacionDTO>>)tipoIdentificaionOutPutPort).Content;

            return result;
        }
    }
}
