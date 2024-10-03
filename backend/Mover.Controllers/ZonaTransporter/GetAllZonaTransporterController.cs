
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.ZonaTransporter;
using Mover.Presenter;
using Mover.UseCasesPorts.ZonaTransporter;

namespace Mover.Controllers.ZonaTransporter
{

    [Route("api/[controller]")]
    [ApiController]
    public class GetAllZonaTransporterController
    {
        private readonly IGetAllZonaTransporterInPutPort getAllZonaTransporterInPutPort;
        private readonly IGetAllZonaTransporterOutPutPort getAllZonaTransporterOutPutPort;

        public GetAllZonaTransporterController(IGetAllZonaTransporterInPutPort getAllZonaTransporterInPutPort, IGetAllZonaTransporterOutPutPort getAllZonaTransporterOutPutPort)
        {
            this.getAllZonaTransporterInPutPort = getAllZonaTransporterInPutPort;
            this.getAllZonaTransporterOutPutPort = getAllZonaTransporterOutPutPort;
        }


        [HttpGet]
        public async Task<List<ZonaTransporterDTO>> GetAllZonaTransporter()
        {
            await getAllZonaTransporterInPutPort.Handle();
            return ((IPresenter<List<ZonaTransporterDTO>>)getAllZonaTransporterOutPutPort).Content;
        }
    }
}
