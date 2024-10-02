
using Mover.DTO.Vehiculos;
using Mover.Entities.Interfaces.Vehiculo.Editar;
using Mover.UseCasesPorts.Vehiculo.Editar;

namespace Mover.UseCases.Vehiculo.Editar
{
    public class EditarVehiculoInteractor : IEditarVehiculoInPutPort
    {
        readonly IEditarVehiculoOutPutPort editarVehiculoOutPutPort;
        readonly IEditarVehiculoRepository editarVehiculoRepository;

        public EditarVehiculoInteractor(IEditarVehiculoOutPutPort editarVehiculoOutPutPort, IEditarVehiculoRepository editarVehiculoRepository)
        {
            this.editarVehiculoOutPutPort = editarVehiculoOutPutPort;
            this.editarVehiculoRepository = editarVehiculoRepository;
        }

        public async Task Handle(VehiculoDTO vehiculo)
        {
            bool result = await editarVehiculoRepository.EditarVehiculo(vehiculo);

            await editarVehiculoOutPutPort.EditarOferta(result);

        }
    }
}
