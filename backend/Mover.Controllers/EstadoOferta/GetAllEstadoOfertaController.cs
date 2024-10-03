
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.EstadoOferta;
using Mover.Presenter;
using Mover.UseCasesPorts.EstadoOferta;

namespace Mover.Controllers.EstadoOferta
{


    [Route("api/[controller]")]
    [ApiController]
    public class GetAllEstadoOfertaController
    {
        private readonly IGetAllEstadoOfertaInPutPort getAllEstadoOfertaInPutPort;
        private readonly IGetAllEstadoOfertaOutPutPort getAllEstadoOfertaOutPutPort;

        public GetAllEstadoOfertaController(IGetAllEstadoOfertaInPutPort getAllEstadoOfertaInPutPort, IGetAllEstadoOfertaOutPutPort getAllEstadoOfertaOutPutPort)
        {
            this.getAllEstadoOfertaInPutPort = getAllEstadoOfertaInPutPort;
            this.getAllEstadoOfertaOutPutPort = getAllEstadoOfertaOutPutPort;
        }

        [HttpGet]
        public async Task<List<EstadoOfertaDTO>> GetAllEstadoOferta()
        {
            await getAllEstadoOfertaInPutPort.Handle();

            return ((IPresenter<List<EstadoOfertaDTO>>)getAllEstadoOfertaOutPutPort).Content;
        }
    }
}
