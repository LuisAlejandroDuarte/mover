using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Multimedia;
using Mover.Presenter;
using Mover.UseCasesPorts.Multimedia.Crear;

namespace Mover.Controllers.MultimediaVehiculo.Crear
{

    [Route("api/[controller]")]
    [ApiController]
    public class CrearMultimediaVehiculoController
    {
        readonly IMultimediaVehiculoInPutPort multimediaVehiculoInPutPort;
        readonly IMultimediaVehiculoOutPutPort multimediaVehiculoOutPutPort;

        public CrearMultimediaVehiculoController(IMultimediaVehiculoInPutPort multimediaVehiculoInPutPort, IMultimediaVehiculoOutPutPort multimediaVehiculoOutPutPort)
        {
            this.multimediaVehiculoInPutPort = multimediaVehiculoInPutPort;
            this.multimediaVehiculoOutPutPort = multimediaVehiculoOutPutPort;
        }

        [HttpPost]
        public async Task<MultimediaVehiculoDTO> AgregarImagenVehiculo([FromForm] MultimediaVehiculoDTO multimediaVehiculoDTO)
        {
            await this.multimediaVehiculoInPutPort.Handle(multimediaVehiculoDTO);
            return ((IPresenter<MultimediaVehiculoDTO>)multimediaVehiculoOutPutPort).Content;
        }
    }
}
