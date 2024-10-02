
using Mover.Entities.Interfaces.Vehiculo.Eliminar;
using Mover.UseCasesPorts.Vehiculo.Eliminar;

namespace Mover.UseCases.Vehiculo.Eliminar
{
    public class EliminarVehiculoInteractor:IEliminarVehiculoInPutPort
    {
        readonly IEliminarVehiculoRepository eliminarVehiculoRepository;
        readonly IEliminarVehiculoOutPutPort eliminarVehiculoOutPutPort;

        public EliminarVehiculoInteractor(IEliminarVehiculoRepository eliminarVehiculoRepository, IEliminarVehiculoOutPutPort eliminarVehiculoOutPutPort)
        {
            this.eliminarVehiculoRepository = eliminarVehiculoRepository;
            this.eliminarVehiculoOutPutPort = eliminarVehiculoOutPutPort;
        }

        public async Task Handle(int Id)
        {
            bool result = await eliminarVehiculoRepository.EliminarVehiculo(Id);

            await eliminarVehiculoOutPutPort.EliminarVehiculo(result);
        }
    }
}
