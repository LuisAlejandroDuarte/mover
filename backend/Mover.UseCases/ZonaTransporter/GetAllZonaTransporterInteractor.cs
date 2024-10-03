
using Mover.Entities.Interfaces.ZonaTransporter;
using Mover.UseCasesPorts.ZonaTransporter;

namespace Mover.UseCases.ZonaTransporter
{
    public class GetAllZonaTransporterInteractor:IGetAllZonaTransporterInPutPort
    {
        readonly IGetAllZonaTransporterOutPutPort getAllZonaTransporterOutPutPort;
        readonly IGetAllZonaTransporterRepository getAllZonaTransporterRepository;

        public GetAllZonaTransporterInteractor(IGetAllZonaTransporterOutPutPort getAllZonaTransporterOutPutPort, IGetAllZonaTransporterRepository getAllZonaTransporterRepository)
        {
            this.getAllZonaTransporterOutPutPort = getAllZonaTransporterOutPutPort;
            this.getAllZonaTransporterRepository = getAllZonaTransporterRepository;
        }

        public async Task Handle()
        {
            var lista = await getAllZonaTransporterRepository.GetAllZonaTransporter();

            await getAllZonaTransporterOutPutPort.GetAllZonaTransporter(lista);
        }
    }
}
