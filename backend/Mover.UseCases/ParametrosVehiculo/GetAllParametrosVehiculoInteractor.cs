
using Mover.Entities.Interfaces.ParametrosVehiculo.Get;
using Mover.UseCasesPorts.ParametrosVehiculo;

namespace Mover.UseCases.ParametrosVehiculo
{
    public class GetAllParametrosVehiculoInteractor:IGetAllParametrosVehiculoInPutPort
    {

        readonly IGetAllParametrosVehiculoOutPutPort getAllParametrosVehiculoOutPutPort;
        readonly IGetAllParametrosVehiculoRepository getAllParametrosVehiculoRepository;

        public GetAllParametrosVehiculoInteractor(IGetAllParametrosVehiculoOutPutPort getAllParametrosVehiculoOutPutPort, IGetAllParametrosVehiculoRepository getAllParametrosVehiculoRepository)
        {
            this.getAllParametrosVehiculoOutPutPort = getAllParametrosVehiculoOutPutPort;
            this.getAllParametrosVehiculoRepository = getAllParametrosVehiculoRepository;
        }

        public async Task Handle()
        {
            var lista = await getAllParametrosVehiculoRepository.GetAllParametrosVehiculo();

            await getAllParametrosVehiculoOutPutPort.GetAllParametrosVehiculoOferta(lista);
        }
    }
}
