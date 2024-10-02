using Microsoft.AspNetCore.Mvc;
using Mover.Presenter;
using Mover.UseCasesPorts.Oferta.Eliminar;
using Mover.UseCasesPorts.Vehiculo.Eliminar;


namespace Mover.Controllers.Vehiculo.Eliminar
{

    [Route("api/[controller]")]
    [ApiController]
    public class EliminarVehiculoController
    {
        readonly IEliminarVehiculoInPutPort eliminarVehiculoInPutPort;
        readonly IEliminarVehiculoOutPutPort eliminarVehiculoOutPutPort;

        public EliminarVehiculoController(IEliminarVehiculoInPutPort eliminarVehiculoInPutPort, IEliminarVehiculoOutPutPort eliminarVehiculoOutPutPort)
        {
            this.eliminarVehiculoInPutPort = eliminarVehiculoInPutPort;
            this.eliminarVehiculoOutPutPort = eliminarVehiculoOutPutPort;
        }

        [HttpDelete]
        public  async Task<bool> EliminarVehiculoPresenter(int Id)
        {
            await eliminarVehiculoInPutPort.Handle(Id);

            return ((IPresenter<bool>)eliminarVehiculoOutPutPort).Content;
        }
    }
}
