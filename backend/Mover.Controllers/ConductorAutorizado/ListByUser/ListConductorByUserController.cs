using Microsoft.AspNetCore.Mvc;
using Mover.DTO.ConductorAutorizado;
using Mover.Presenter;
using Mover.UseCasesPorts.ConductorAutorizado.ListaByUser;

namespace Mover.Controllers.ConductorAutorizado.ListByUser
{

    [Route("api/[controller]")]
    [ApiController]
    public class ListConductorByUserController
    {
        private readonly IListaConductorByUserInPutPort listaConductorByUserInPutPort;
        private readonly IListaConductorByUserOutPutPort listaConductorByUserOutPutPort;

        public ListConductorByUserController(IListaConductorByUserInPutPort listaConductorByUserInPutPort, IListaConductorByUserOutPutPort listaConductorByUserOutPutPort)
        {
            this.listaConductorByUserInPutPort = listaConductorByUserInPutPort;
            this.listaConductorByUserOutPutPort = listaConductorByUserOutPutPort;
        }

        [HttpGet]
        public async Task<List<ConductorAutorizadoDTO>> ListaConductorByUser(int IdUser)
        {
            await listaConductorByUserInPutPort.Handle(IdUser);

            return ((IPresenter<List<ConductorAutorizadoDTO>>)listaConductorByUserOutPutPort).Content;

        }
    }
}
