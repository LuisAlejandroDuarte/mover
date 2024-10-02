using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Oferta;
using Mover.Presenter;
using Mover.UseCasesPorts.Oferta.Editar;

namespace Mover.Controllers.Oferta.Editar
{
    [Route("api/[controller]")]
    [ApiController]
    public class EditarOfertaController
    {
        readonly IEditarOfertaInPutPort editarOfertaInPutPort;
        readonly IEditarOfertaOutPutPort editarOfertaOutPutPort;

        public EditarOfertaController(IEditarOfertaInPutPort editarOfertaInPutPort, IEditarOfertaOutPutPort editarOfertaOutPutPort)
        {
            this.editarOfertaInPutPort = editarOfertaInPutPort;
            this.editarOfertaOutPutPort = editarOfertaOutPutPort;
        }

        [HttpPut]
        public async Task<bool> EditarOferta(OfertaDTO oferta)
        {
            await editarOfertaInPutPort.Handle(oferta);
            return ((IPresenter<bool>)editarOfertaOutPutPort).Content;
        }
    }
}
