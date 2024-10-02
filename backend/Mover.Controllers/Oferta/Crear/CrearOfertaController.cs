using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Oferta;
using Mover.Presenter;
using Mover.UseCasesPorts.Oferta.Crear;


namespace Mover.Controllers.Oferta.Crear
{
    [Route("api/[controller]")]
    [ApiController]
    public class CrearOfertaController
    {
        readonly ICrearOfertaInPutPort crearOfertaInPutPort;
        readonly ICrearOfertaOutPutPort crearOfertaOutPutPort;

        public CrearOfertaController(ICrearOfertaInPutPort crearOfertaInPutPort, ICrearOfertaOutPutPort crearOfertaOutPutPort)
        {
            this.crearOfertaInPutPort = crearOfertaInPutPort;
            this.crearOfertaOutPutPort = crearOfertaOutPutPort;
        }

        [HttpPost]
        public async Task<int> CrearOferta(OfertaDTO oferta)
        {
            await this.crearOfertaInPutPort.Handle(oferta);
            return ((IPresenter<int>)crearOfertaOutPutPort).Content;

        }
    }
}
