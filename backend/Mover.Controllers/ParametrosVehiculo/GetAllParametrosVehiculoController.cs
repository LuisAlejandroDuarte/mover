

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Vehiculos;
using Mover.Presenter;
using Mover.UseCasesPorts.ParametrosVehiculo;

namespace Mover.Controllers.ParametrosVehiculo
{


    [Route("api/[controller]")]
    [ApiController]
    public class GetAllParametrosVehiculoController
    {
        private readonly IGetAllParametrosVehiculoInPutPort getAllParametrosVehiculoInPutPort;
        private readonly IGetAllParametrosVehiculoOutPutPort getAllParametrosVehiculoOutPutPort;

        public GetAllParametrosVehiculoController(IGetAllParametrosVehiculoInPutPort getAllParametrosVehiculoInPutPort, IGetAllParametrosVehiculoOutPutPort getAllParametrosVehiculoOutPutPort)
        {
            this.getAllParametrosVehiculoInPutPort = getAllParametrosVehiculoInPutPort;
            this.getAllParametrosVehiculoOutPutPort = getAllParametrosVehiculoOutPutPort;
        }

        [HttpGet]
        [Authorize]
        public async Task<List<ParametrosVehiculoDTO>> GetAllParametrosVehiculo()
        {
            await getAllParametrosVehiculoInPutPort.Handle();


            return ((IPresenter<List<ParametrosVehiculoDTO>>)getAllParametrosVehiculoOutPutPort).Content;
        }
    }
}
