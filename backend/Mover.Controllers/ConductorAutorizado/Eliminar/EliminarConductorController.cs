using Microsoft.AspNetCore.Mvc;
using Mover.Presenter;
using Mover.UseCasesPorts.ConductorAutorizado.Eliminar;

namespace Mover.Controllers.ConductorAutorizado.Eliminar
{


    [Route("api/[controller]")]
    [ApiController]
    public class EliminarConductorController
    {
        readonly IEliminarConductorInPutPort EliminarConductorInPutPort;
        readonly IEliminarConductorOutPutPort EliminarConductorOutPutPort;

        public EliminarConductorController(IEliminarConductorInPutPort EliminarConductorInPutPort, IEliminarConductorOutPutPort EliminarConductorOutPutPort)
        {
            this.EliminarConductorInPutPort = EliminarConductorInPutPort;
            this.EliminarConductorOutPutPort = EliminarConductorOutPutPort;
        }

        [HttpDelete]
        public async Task<bool> EliminarConductor(int id)
        {
            await this.EliminarConductorInPutPort.Handle(id);
            return ((IPresenter<bool>)EliminarConductorOutPutPort).Content;
        }
    }
}
