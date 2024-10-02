
using Microsoft.AspNetCore.Mvc;
using Mover.Presenter;
using Mover.UseCasesPorts.Equipo.Eliminar;

namespace Mover.Controllers.Equipo.Eliminar
{

    [Route("api/[controller]")]
    [ApiController]
    public class EliminarEquipoController
    {
        readonly IEliminarEquipoInPutPort EliminarEquipoInPutPort;
        readonly IEliminarEquipoOutPutPort EliminarEquipoOutPutPort;

        public EliminarEquipoController(IEliminarEquipoInPutPort EliminarEquipoInPutPort, IEliminarEquipoOutPutPort EliminarEquipoOutPutPort)
        {
            this.EliminarEquipoInPutPort = EliminarEquipoInPutPort;
            this.EliminarEquipoOutPutPort = EliminarEquipoOutPutPort;
        }

        [HttpDelete]
        public async Task<bool> EliminarEquipo(int id)
        {
            await this.EliminarEquipoInPutPort.Handle(id);
            return ((IPresenter<bool>)EliminarEquipoOutPutPort).Content;
        }
    }
}
