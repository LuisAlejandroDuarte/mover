

using Microsoft.AspNetCore.Mvc;
using Mover.DTO.ConductorAutorizado;
using Mover.Presenter;
using Mover.UseCasesPorts.ConductorAutorizado.Crear;

namespace Mover.Controllers.ConductorAutorizado.Crear
{
    [Route("api/[controller]")]
    [ApiController]
    public class CrearConductorController
    {
        readonly ICrearConductorInPutPort crearConductorInPutPort;
        readonly ICrearConductorOutPutPort crearConductorOutPutPort;

        public CrearConductorController(ICrearConductorInPutPort crearConductorInPutPort, ICrearConductorOutPutPort crearConductorOutPutPort)
        {
            this.crearConductorInPutPort = crearConductorInPutPort;
            this.crearConductorOutPutPort = crearConductorOutPutPort;
        }

        [HttpPost]
        public async Task<int> CrearConductor(ConductorAutorizadoDTO Conductor)
        {
            await this.crearConductorInPutPort.Handle(Conductor);
            return ((IPresenter<int>)crearConductorOutPutPort).Content;
        }
    }
}
