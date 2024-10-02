using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Oferta;
using Mover.Presenter;
using Mover.UseCasesPorts.Oferta.ListaByUser;

namespace Mover.Controllers.Oferta.ListByUser
{
    [Route("api/[controller]")]
    [ApiController]
    public class ListOfertaByUserController
    {
        private readonly IListaOfertaByUserInPutPort listaOfertaByUserInPutPort;
        private readonly IListaOfertaByUserOutPutPort listaOfertaByUserOutPutPort;

        public ListOfertaByUserController(IListaOfertaByUserInPutPort listaOfertaByUserInPutPort, IListaOfertaByUserOutPutPort listaOfertaByUserOutPutPort)
        {
            this.listaOfertaByUserInPutPort = listaOfertaByUserInPutPort;
            this.listaOfertaByUserOutPutPort = listaOfertaByUserOutPutPort;
        }

        [HttpGet]
        public async Task<List<OfertaDTO>> ListaOfertaByUser(int IdUser)
        {
            await listaOfertaByUserInPutPort.Handle(IdUser);

            return ((IPresenter<List<OfertaDTO>>)listaOfertaByUserOutPutPort).Content;

        }
    }
}
