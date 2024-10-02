
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Dispositivo;
using Mover.Presenter;
using Mover.UseCasesPorts.Dispositivos.Crear;


namespace Mover.Controllers.Dispositivo.Crear
{
    [Route("api/[controller]")]
    [ApiController]
    public class CrearDispositivoController
    {


        readonly ICrearDispositivoInPutPort crearDispositivoInPutPort;
        readonly ICrearDispositivoOutPutPort crearDispositivoOutPutPort;

        public CrearDispositivoController(ICrearDispositivoInPutPort crearDispositivoInPutPort, ICrearDispositivoOutPutPort crearDispositivoOutPutPort)
        {
            this.crearDispositivoInPutPort = crearDispositivoInPutPort;
            this.crearDispositivoOutPutPort = crearDispositivoOutPutPort;
        }


        [HttpPost]
        [Authorize]
        public async Task<int?> CrearDispositivo(DispositivoDTO  dispositivoDTO)
        {
            await this.crearDispositivoInPutPort.Handle(dispositivoDTO);
            return ((IPresenter<int?>)crearDispositivoOutPutPort).Content;
        }
    }
}
