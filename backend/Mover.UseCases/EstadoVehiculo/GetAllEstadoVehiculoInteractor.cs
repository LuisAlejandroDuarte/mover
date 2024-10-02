
using Mover.Entities.Interfaces.EstadoVehiculo;
using Mover.UseCasesPorts.EstadoVehiculo;

namespace Mover.UseCases.EstadoVehiculo
{
    public class GetAllEstadoVehiculoInteractor:IGetAllEstadoVehiculoInPutPort
    {

        readonly IGetAllEstadoVehiculoOutPutPort getAllEstadoVehiculoOutPutPort;
        readonly IGetAllEstadoVehiculoRepository getAllEstadoVehiculoRepository;

        public GetAllEstadoVehiculoInteractor(IGetAllEstadoVehiculoOutPutPort getAllEstadoVehiculoOutPutPort, IGetAllEstadoVehiculoRepository getAllEstadoVehiculoRepository)
        {
            this.getAllEstadoVehiculoOutPutPort = getAllEstadoVehiculoOutPutPort;
            this.getAllEstadoVehiculoRepository = getAllEstadoVehiculoRepository;
        }

        public async Task Handle()
        {
            var lista = await getAllEstadoVehiculoRepository.GetAllEstadoVehiculo();

            await getAllEstadoVehiculoOutPutPort.GetAllEstadoVehiculo(lista);
        }
    }
}
