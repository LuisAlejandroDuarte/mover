

using Mover.DTO.Dispositivo;
using Mover.Entities.Interfaces.Dispositivos.Get.ByDeviceId;
using Mover.UseCasesPorts.Dispositivos.Get.ByDeviceId;

namespace Mover.UseCases.Dispositivos.Get.ByDeviceId
{
    public class GetDispositivoByDeviceIdInteractor : IDispositivoGetByDeviceIdInPutPort
    {

        readonly IDispositivoGetByDeviceIdOutPutPort dispositivoGetByDeviceIdOutPutPort;
        readonly IGetByDeviceIdDispositivoRepository getByDeviceIdDispositivoRepository;

        public GetDispositivoByDeviceIdInteractor(IDispositivoGetByDeviceIdOutPutPort dispositivoGetByDeviceIdOutPutPort, IGetByDeviceIdDispositivoRepository getByDeviceIdDispositivoRepository)
        {
            this.dispositivoGetByDeviceIdOutPutPort = dispositivoGetByDeviceIdOutPutPort;
            this.getByDeviceIdDispositivoRepository = getByDeviceIdDispositivoRepository;
        }

        public async Task Handle(string deviceId)
        {
            DispositivoDTO dispositivo =  await getByDeviceIdDispositivoRepository.GetByDeviceIdDispositivo(deviceId);

            await dispositivoGetByDeviceIdOutPutPort.GetDispositivo(dispositivo);


        }
    }
}
