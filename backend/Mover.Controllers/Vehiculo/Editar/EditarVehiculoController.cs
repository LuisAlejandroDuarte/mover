using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Vehiculos;
using Mover.Presenter;
using Mover.UseCasesPorts.Vehiculo.Editar;

namespace Mover.Controllers.Vehiculo.Editar
{
    [Route("api/[controller]")]
    [ApiController]
    public class EditarVehiculoController 
    {
        readonly IEditarVehiculoInPutPort editarVehiculoInPutPort;
        readonly IEditarVehiculoOutPutPort editarVehiculoOutPutPort;

        public EditarVehiculoController(IEditarVehiculoInPutPort editarVehiculoInPutPort, IEditarVehiculoOutPutPort editarVehiculoOutPutPort)
        {
            this.editarVehiculoInPutPort = editarVehiculoInPutPort;
            this.editarVehiculoOutPutPort = editarVehiculoOutPutPort;
        }


        [HttpPut]
        public async Task<bool> EditarVehiculo(VehiculoDTO vehiculo)
        {
            await editarVehiculoInPutPort.Handle(vehiculo);
            return ((IPresenter<bool>)editarVehiculoOutPutPort).Content;

        }
    }
}
