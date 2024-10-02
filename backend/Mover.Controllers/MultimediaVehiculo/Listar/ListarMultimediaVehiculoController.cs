

using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Multimedia;
using Mover.Presenter;
using Mover.UseCasesPorts.Multimedia.Lista;

namespace Mover.Controllers.MultimediaVehiculo.Listar
{

    [Route("api/[controller]")]
    [ApiController]
    public class ListarMultimediaVehiculoController
    {
        readonly IListaMultimediaVehiculoInPutPort listaMultimediaVehiculoInPutPort;
        readonly IListaMultimediaVehiculoOutPutPort listaMultimediaVehiculoOutPutPort;

        public ListarMultimediaVehiculoController(IListaMultimediaVehiculoInPutPort listaMultimediaVehiculoInPutPort, IListaMultimediaVehiculoOutPutPort listaMultimediaVehiculoOutPutPort)
        {
            this.listaMultimediaVehiculoInPutPort = listaMultimediaVehiculoInPutPort;
            this.listaMultimediaVehiculoOutPutPort = listaMultimediaVehiculoOutPutPort;
        }

        [HttpGet]
        public async Task<List<MultimediaVehiculoDTO>> ListarMultimediaVehiculo(int idVehiculo)
        {
            await this.listaMultimediaVehiculoInPutPort.Handle(idVehiculo);
            return ((IPresenter<List<MultimediaVehiculoDTO>>)listaMultimediaVehiculoOutPutPort).Content;
        }
    }
}
