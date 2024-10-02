using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Equipo;
using Mover.Presenter;
using Mover.UseCasesPorts.Equipo.Crear;

namespace Mover.Controllers.Equipo.Crear
{
    [Route("api/[controller]")]
    [ApiController]
    public class CrearEquipoController
    {
        readonly ICrearEquipoInPutPort crearEquipoInPutPort;
        readonly ICrearEquipoOutPutPort crearEquipoOutPutPort;

        public CrearEquipoController(ICrearEquipoInPutPort crearEquipoInPutPort, ICrearEquipoOutPutPort crearEquipoOutPutPort)
        {
            this.crearEquipoInPutPort = crearEquipoInPutPort;
            this.crearEquipoOutPutPort = crearEquipoOutPutPort;
        }

        [HttpPost]
        public async Task<int> CrearEquipo(EquipoDTO equipo)
        {
            await this.crearEquipoInPutPort.Handle(equipo);
            return ((IPresenter<int>)crearEquipoOutPutPort).Content;
        }
    }
}
