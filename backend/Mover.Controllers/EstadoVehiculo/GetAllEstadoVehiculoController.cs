
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Vehiculos;
using Mover.Presenter;
using Mover.UseCasesPorts.EstadoVehiculo;

namespace Mover.Controllers.EstadoVehiculo
{

    [Route("api/[controller]")]
    [ApiController]

    public class GetAllEstadoVehiculoController
    {
        readonly IGetAllEstadoVehiculoInPutPort getAllEstadoVehiculoInPutPort;
        readonly IGetAllEstadoVehiculoOutPutPort getAllEstadoVehiculoOutPutPort;

        public GetAllEstadoVehiculoController(IGetAllEstadoVehiculoInPutPort getAllEstadoVehiculoInPutPort, IGetAllEstadoVehiculoOutPutPort getAllEstadoVehiculoOutPutPort)
        {
            this.getAllEstadoVehiculoInPutPort = getAllEstadoVehiculoInPutPort;
            this.getAllEstadoVehiculoOutPutPort = getAllEstadoVehiculoOutPutPort;
        }

        [HttpGet]
        [Authorize]
        public async Task<List<EstadoVehiculoDTO>> GetAllEstadoVehiculo()
        {
            await getAllEstadoVehiculoInPutPort.Handle();

            return ((IPresenter<List<EstadoVehiculoDTO>>)getAllEstadoVehiculoOutPutPort).Content;
        }
    }
}
