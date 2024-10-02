
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.ConductorAutorizado;
using Mover.Presenter;
using Mover.UseCasesPorts.ConductorAutorizado.Editar;

namespace Mover.Controllers.ConductorAutorizado.Editar
{

    [Route("api/[controller]")]
    [ApiController]
    public class EditarConductorController
    {
        readonly IEditarConductorInPutPort EditarConductorInPutPort;
        readonly IEditarConductorOutPutPort EditarConductorOutPutPort;

        public EditarConductorController(IEditarConductorInPutPort EditarConductorInPutPort, IEditarConductorOutPutPort EditarConductorOutPutPort)
        {
            this.EditarConductorInPutPort = EditarConductorInPutPort;
            this.EditarConductorOutPutPort = EditarConductorOutPutPort;
        }

        [HttpPut]
        public async Task<bool> EditarConductor(ConductorAutorizadoDTO Conductor)
        {
            await this.EditarConductorInPutPort.Handle(Conductor);
            return ((IPresenter<bool>)EditarConductorOutPutPort).Content;
        }
    }
}
