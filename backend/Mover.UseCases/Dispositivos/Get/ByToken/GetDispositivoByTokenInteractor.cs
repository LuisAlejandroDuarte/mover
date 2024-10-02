
using Mover.DTO.Dispositivo;
using Mover.Entities.Interfaces.Dispositivos.Get.ByToken;
using Mover.UseCasesPorts.Dispositivos.Get.ByToken;

namespace Mover.UseCases.Dispositivos.Get.ByToken
{
    public class GetDispositivoByTokenInteractor : IDispositivoGetByTokenInPutPort
    {
        
        readonly IDispositivoGetByTokenOutPutPort dispositivoGetByTokenOutPutPort;
        readonly IGetByTokenDispositivoRepository getByTokenDispositivoRepository;

        public GetDispositivoByTokenInteractor(IDispositivoGetByTokenOutPutPort dispositivoGetByTokenOutPutPort, IGetByTokenDispositivoRepository getByTokenDispositivoRepository)
        {
            this.dispositivoGetByTokenOutPutPort = dispositivoGetByTokenOutPutPort;
            this.getByTokenDispositivoRepository = getByTokenDispositivoRepository;
        }

        public async Task Handle(string token)
        {
            DispositivoDTO dispositivo = await this.getByTokenDispositivoRepository.GetDispositivoByToken(token);

            await dispositivoGetByTokenOutPutPort.GetDispositivo(dispositivo);

        }
    }
}
