using Mover.DTO.Vehiculos;
using Mover.Entities.Interfaces.Vehiculo.Crear;
using Mover.UseCasesPorts.Vehiculo.Crear;

namespace Mover.UseCases.Vehiculo.Crear
{
    public class CrearVehiculoInteractor: ICrearVehiculoInPutPort
    {
        readonly ICrearVehiculoOutPutPort outPutPort;
        readonly ICrearVehiculoRepository repository;

        public CrearVehiculoInteractor(ICrearVehiculoOutPutPort outPutPort, ICrearVehiculoRepository repository)
        {
            this.outPutPort = outPutPort;
            this.repository = repository;
        }

        public async Task Handle(VehiculoDTO vehiculo)
        {
            int result = await repository.CrearVehiculo(vehiculo);

            await this.outPutPort.CrearVehiculo(result);
        }
    }
}
