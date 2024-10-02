
using Mover.Entities.Interfaces.Modelo.Gett.All;
using Mover.UseCasesPorts.Modelo.Get.All;

namespace Mover.UseCases.Modelo.Get.All
{
    public class GetAllModeloInteractor :IGetAllModeloInPutPort
    {
        readonly IGetAllModeloOutPutPort getAllModeloOutPutPort;
        readonly IGetAllModeloRepository getAllModeloRepository;

        public GetAllModeloInteractor(IGetAllModeloOutPutPort getAllModeloOutPutPort, IGetAllModeloRepository getAllModeloRepository)
        {
            this.getAllModeloOutPutPort = getAllModeloOutPutPort;
            this.getAllModeloRepository = getAllModeloRepository;
        }

        public async Task Handle()
        {
            var listModelo = await getAllModeloRepository.GetAllModelo();

            await getAllModeloOutPutPort.GetAllModelo(listModelo);
        }
    }
}
