
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Vehiculos;
using Mover.Presenter;
using Mover.UseCasesPorts.Vehiculo.Crear;

namespace Mover.Controllers.Vehiculo.Crear
{

    [Route("api/[controller]")]
    [ApiController]
    public class CrearVehiculoController
    {
        readonly ICrearVehiculoInPutPort crearVehiculoInPutPort;
        readonly ICrearVehiculoOutPutPort crearVehiculoOutPut;

        public CrearVehiculoController(ICrearVehiculoInPutPort crearVehiculoInPutPort, ICrearVehiculoOutPutPort crearVehiculoOutPut)
        {
            this.crearVehiculoInPutPort = crearVehiculoInPutPort;
            this.crearVehiculoOutPut = crearVehiculoOutPut;
        }

        [HttpPost]
        public async Task<int> CrearVehiculo(VehiculoDTO vehiculo)
        {
            await crearVehiculoInPutPort.Handle(vehiculo);
            return ((IPresenter<int>)crearVehiculoOutPut).Content;
        }        
    }
}
