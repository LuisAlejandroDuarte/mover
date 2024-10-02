
using Mover.Entities.Interfaces.CondicionVehiculo;
using Mover.UseCasesPorts.CondicionVehiculo;

namespace Mover.UseCases.CondicionVehiculo
{
    public class GetAllCondicionVehiculoInteractor : IGetAllCondicionVehiculoInPutPort
    {

        readonly IGetAllCondicionVehiculoOutPutPort getAllCondicionVehiculoOutPutPort;
        readonly IGetAllCondicionVehiculoRepository getAllCondicionVehiculoRepository;

        public GetAllCondicionVehiculoInteractor(IGetAllCondicionVehiculoOutPutPort getAllCondicionVehiculoOutPutPort, IGetAllCondicionVehiculoRepository getAllCondicionVehiculoRepository)
        {
            this.getAllCondicionVehiculoOutPutPort = getAllCondicionVehiculoOutPutPort;
            this.getAllCondicionVehiculoRepository = getAllCondicionVehiculoRepository;
        }

        public async Task Handle()
        {
            var lista = await getAllCondicionVehiculoRepository.GetAllCondicionVehiculo();

            await getAllCondicionVehiculoOutPutPort.GetAllCondicionVehiculo(lista);

           
        }
    }
}
