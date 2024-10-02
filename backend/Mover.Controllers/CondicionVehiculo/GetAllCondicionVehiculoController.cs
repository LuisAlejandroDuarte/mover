
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Vehiculos;
using Mover.Presenter;
using Mover.UseCasesPorts.CondicionVehiculo;

namespace Mover.Controllers.CondicionVehiculo
{


    [Route("api/[controller]")]
    [ApiController]
    public class GetAllCondicionVehiculoController
    {


        readonly IGetAllCondicionVehiculoInPutPort getAllCondicionVehiculoInPutPort;
        readonly IGetAllCondicionVehiculoOutPutPort getAllCondicionVehiculoOutPutPort;

        public GetAllCondicionVehiculoController(IGetAllCondicionVehiculoInPutPort getAllCondicionVehiculoInPutPort, IGetAllCondicionVehiculoOutPutPort getAllCondicionVehiculoOutPutPort)
        {
            this.getAllCondicionVehiculoInPutPort = getAllCondicionVehiculoInPutPort;
            this.getAllCondicionVehiculoOutPutPort = getAllCondicionVehiculoOutPutPort;
        }

        [HttpGet]
        [Authorize]
        public async Task<List<CondicionVehiculoDTO>> GetAllCondicionVehiculo()
        {
            await getAllCondicionVehiculoInPutPort.Handle();

            return ((IPresenter<List<CondicionVehiculoDTO>>)getAllCondicionVehiculoOutPutPort).Content;
        }
    }
}
