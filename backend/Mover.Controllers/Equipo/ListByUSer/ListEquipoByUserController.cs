
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Equipo;
using Mover.Presenter;
using Mover.UseCasesPorts.Equipo.ListaByUser;

namespace Mover.Controllers.Equipo.ListByUSer
{

    [Route("api/[controller]")]
    [ApiController]
    public class ListEquipoByUserController
    {
        private readonly IListaEquipoByUserInPutPort listaEquipoByUserInPutPort;
        private readonly IListaEquipoByUserOutPutPort listaEquipoByUserOutPutPort;

        public ListEquipoByUserController(IListaEquipoByUserInPutPort listaEquipoByUserInPutPort, IListaEquipoByUserOutPutPort listaEquipoByUserOutPutPort)
        {
            this.listaEquipoByUserInPutPort = listaEquipoByUserInPutPort;
            this.listaEquipoByUserOutPutPort = listaEquipoByUserOutPutPort;
        }

        [HttpGet]
        public async Task<List<EquipoDTO>> ListaEquipoByUser(int IdUser)
        {
            await listaEquipoByUserInPutPort.Handle(IdUser);

            return ((IPresenter<List<EquipoDTO>>)listaEquipoByUserOutPutPort).Content;

        }
    }
}
