
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Equipo;
using Mover.Presenter;
using Mover.UseCasesPorts.Equipo.Editar;

namespace Mover.Controllers.Equipo.Editar
{

    [Route("api/[controller]")]
    [ApiController]
    public class EditarEquipoController
    {
        readonly IEditarEquipoInPutPort EditarEquipoInPutPort;
        readonly IEditarEquipoOutPutPort EditarEquipoOutPutPort;

        public EditarEquipoController(IEditarEquipoInPutPort EditarEquipoInPutPort, IEditarEquipoOutPutPort EditarEquipoOutPutPort)
        {
            this.EditarEquipoInPutPort = EditarEquipoInPutPort;
            this.EditarEquipoOutPutPort = EditarEquipoOutPutPort;
        }

        [HttpPut]
        public async Task<bool> EditarEquipo(EquipoDTO equipo)
        {
            await this.EditarEquipoInPutPort.Handle(equipo);
            return ((IPresenter<bool>)EditarEquipoOutPutPort).Content;
        }
    }
}
