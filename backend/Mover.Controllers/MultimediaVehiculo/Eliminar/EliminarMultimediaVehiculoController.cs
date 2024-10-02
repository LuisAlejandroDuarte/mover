using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Multimedia;
using Mover.Presenter;
using Mover.UseCasesPorts.Multimedia.Eliminar;

namespace Mover.Controllers.MultimediaVehiculo.Eliminar
{

    [Route("api/[controller]")]
    [ApiController]
    public class EliminarMultimediaVehiculoController
    {
        readonly IEliminarMultiemdiaVehiculoInPutPort eliminarMultiemdiaVehiculoInPutPort;
        readonly IEliminarMultimediaVehiculoOutPutPort eliminarMultimediaVehiculoOutPutPort;

        public EliminarMultimediaVehiculoController(IEliminarMultiemdiaVehiculoInPutPort eliminarMultiemdiaVehiculoInPutPort, IEliminarMultimediaVehiculoOutPutPort eliminarMultimediaVehiculoOutPutPort)
        {
            this.eliminarMultiemdiaVehiculoInPutPort = eliminarMultiemdiaVehiculoInPutPort;
            this.eliminarMultimediaVehiculoOutPutPort = eliminarMultimediaVehiculoOutPutPort;
        }

        [HttpDelete]
        public async Task<bool> EliminarMultimediaVehiculo(int id)
        {
            await this.eliminarMultiemdiaVehiculoInPutPort.Handle(id);
            return ((IPresenter<bool>)eliminarMultimediaVehiculoOutPutPort).Content;
        }
    }
}
