
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Dispositivo;
using Mover.Presenter;
using Mover.UseCasesPorts.Dispositivos.Get.ByDeviceId;


namespace Mover.Controllers.Dispositivo.Get.ByDeviceId
{

    [Route("api/[controller]")]
    [ApiController]
    public class GetByDeviceIdDispositivoController
    {

        private readonly IDispositivoGetByDeviceIdInPutPort dispositivoGetByDeviceIdInPutPort;
        private readonly IDispositivoGetByDeviceIdOutPutPort dispositivoGetByDeviceIdOutPutPort;

        public GetByDeviceIdDispositivoController(IDispositivoGetByDeviceIdInPutPort dispositivoGetByDeviceIdInPutPort, IDispositivoGetByDeviceIdOutPutPort dispositivoGetByDeviceIdOutPutPort)
        {
            this.dispositivoGetByDeviceIdInPutPort = dispositivoGetByDeviceIdInPutPort;
            this.dispositivoGetByDeviceIdOutPutPort = dispositivoGetByDeviceIdOutPutPort;
        }

        [HttpGet]
        [Authorize]
        public async Task<DispositivoDTO> GetDispositivoByDeviceId(string deviceId)
        {
            await dispositivoGetByDeviceIdInPutPort.Handle(deviceId);

            return ((IPresenter<DispositivoDTO>)dispositivoGetByDeviceIdOutPutPort).Content;
        }

    }
}
