using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Ubicaciones;
using Mover.Presenter;
using Mover.UseCasesPorts.Ubicacion.Editar;


namespace Mover.Controllers.Ubicacion.Editar
{

    [Route("api/[controller]")]
    [ApiController]
    public class EditarUbicacionController
    {
        readonly IEditarUbicacionInPutPort EditarUbicacionInPutPort;
        readonly IEditarUbicacionOutPutPort EditarUbicacionOutPutPort;

        public EditarUbicacionController(IEditarUbicacionInPutPort EditarUbicacionInPutPort, IEditarUbicacionOutPutPort EditarUbicacionOutPutPort)
        {
            this.EditarUbicacionInPutPort = EditarUbicacionInPutPort;
            this.EditarUbicacionOutPutPort = EditarUbicacionOutPutPort;
        }

        [HttpPut]
        public async Task<bool> EditarUbicacion(UbicacionDTO ubicacionDTO)
        {
            await EditarUbicacionInPutPort.Handle(ubicacionDTO);

            return ((IPresenter<bool>)EditarUbicacionOutPutPort).Content;
        }
    }
}
