
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Dispositivo;
using Mover.Presenter;
using Mover.UseCasesPorts.Dispositivos.Get.ByToken;

namespace Mover.Controllers.Dispositivo.Get.ByToken
{

    [Route("api/[controller]")]
    [ApiController]
    public class GetByTokenDispositivoController
    {
        private readonly IDispositivoGetByTokenInPutPort dispositivoGetByTokenInPutPort;
        private readonly IDispositivoGetByTokenOutPutPort dispositivoGetByTokenOutPutPort;

        public GetByTokenDispositivoController(IDispositivoGetByTokenInPutPort dispositivoGetByTokenInPutPort, IDispositivoGetByTokenOutPutPort dispositivoGetByTokenOutPutPort)
        {
            this.dispositivoGetByTokenInPutPort = dispositivoGetByTokenInPutPort;
            this.dispositivoGetByTokenOutPutPort = dispositivoGetByTokenOutPutPort;
        }

        [HttpGet]
        [Authorize]
        public async Task<DispositivoDTO> GetDispositivoByToken(string token)
        {
            await dispositivoGetByTokenInPutPort.Handle(token);

            return ((IPresenter<DispositivoDTO>)dispositivoGetByTokenOutPutPort).Content;
        }
    }
}
