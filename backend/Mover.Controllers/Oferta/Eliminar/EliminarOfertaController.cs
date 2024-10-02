using Microsoft.AspNetCore.Mvc;
using Mover.Presenter;
using Mover.UseCasesPorts.Oferta.Eliminar;

namespace Mover.Controllers.Oferta.Eliminar
{
    [Route("api/[controller]")]
    [ApiController]
    public class EliminarOfertaController
    {
        readonly IEliminarOfertaInPutPort eliminarOfertaInPutPort;
        readonly IEliminarOfertaOutPutPort eliminarOfertaOutPutPort;

        public EliminarOfertaController(IEliminarOfertaInPutPort eliminarOfertaInPutPort, IEliminarOfertaOutPutPort eliminarOfertaOutPutPort)
        {
            this.eliminarOfertaInPutPort = eliminarOfertaInPutPort;
            this.eliminarOfertaOutPutPort = eliminarOfertaOutPutPort;
        }

        [HttpDelete]
        public async Task<bool> EliminarOferta(int id)
        {
            await eliminarOfertaInPutPort.Handle(id);
            return ((IPresenter<bool>)eliminarOfertaOutPutPort).Content;
        }
    }
}
