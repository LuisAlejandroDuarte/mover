

using Mover.Entities.Interfaces.Carroceria.Get.ByIdClase;
using Mover.UseCasesPorts.Carroceria.Get.ByIdClase;

namespace Mover.UseCases.Carroceria.ByIdClase
{
    public class GetCarroceriaByIdClaseInteractor: IGetCarroceriaByIdClaseInPutPort
    {
        readonly IGetCarroceriaByIdClaseOutPutPort  getCarroceriaByIdClaseOutPutPort;
        readonly IGetCarroceriaByIdClaseRepository  getCarroceriaByIdClaseRepository;

        public GetCarroceriaByIdClaseInteractor(IGetCarroceriaByIdClaseOutPutPort getCarroceriaByIdClaseOutPutPort, IGetCarroceriaByIdClaseRepository getCarroceriaByIdClaseRepository)
        {
            this.getCarroceriaByIdClaseOutPutPort = getCarroceriaByIdClaseOutPutPort;
            this.getCarroceriaByIdClaseRepository = getCarroceriaByIdClaseRepository;
        }

        public async Task Handle(int idClase)
        {
            var listCarroceria = await getCarroceriaByIdClaseRepository.GetCarroceriaByIdClase(idClase);
            await getCarroceriaByIdClaseOutPutPort.GetCarroceriaByIdClase(listCarroceria);
        }
    }
}
