

using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Ubicaciones;
using Mover.Presenter;
using Mover.UseCasesPorts.Ubicacion.Crear;

namespace Mover.Controllers.Ubicacion.Crear
{


    [Route("api/[controller]")]
    [ApiController]
    public class CrearUbicacionController
    {
        readonly ICrearUbicacionInPutPort crearUbicacionInPutPort;
        readonly ICrearUbicacionOutPutPort crearUbicacionOutPutPort;

        public CrearUbicacionController(ICrearUbicacionInPutPort crearUbicacionInPutPort, ICrearUbicacionOutPutPort crearUbicacionOutPutPort)
        {
            this.crearUbicacionInPutPort = crearUbicacionInPutPort;
            this.crearUbicacionOutPutPort = crearUbicacionOutPutPort;
        }

        [HttpPost]
        public async Task<int> CrearUbicacion(UbicacionDTO ubicacionDTO)
        {
            await  crearUbicacionInPutPort.Handle(ubicacionDTO);

            return ((IPresenter<int>)crearUbicacionOutPutPort).Content;
        }
    }
}
