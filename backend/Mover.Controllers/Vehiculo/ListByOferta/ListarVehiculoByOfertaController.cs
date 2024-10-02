using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Vehiculos;
using Mover.Presenter;
using Mover.UseCasesPorts.Vehiculo.ListByOferta;


namespace Mover.Controllers.Vehiculo.ListByOferta
{

    [Route("api/[controller]")]
    [ApiController]
    public class ListarVehiculoByOfertaController
    {
        readonly IListaVehiculoByOfertaInPutPort listaVehiculoByOfertaInPutPort;
        readonly IListaVehiculoByOfertaOutPutPort listaVehiculoByOfertaOutPutPort;

        public ListarVehiculoByOfertaController(IListaVehiculoByOfertaInPutPort listaVehiculoByOfertaInPutPort, IListaVehiculoByOfertaOutPutPort listaVehiculoByOfertaOutPutPort)
        {
            this.listaVehiculoByOfertaInPutPort = listaVehiculoByOfertaInPutPort;
            this.listaVehiculoByOfertaOutPutPort = listaVehiculoByOfertaOutPutPort;
        }

        [HttpGet]
        public async Task<List<VehiculoDTO>> GetListaVehiculoByOferta(int IdOferta)
        {
            await listaVehiculoByOfertaInPutPort.Handle(IdOferta);

            return ((IPresenter<List<VehiculoDTO>>)listaVehiculoByOfertaOutPutPort).Content;
        }
    }
}
