
using Mover.Entities.Interfaces.Multimedia.Eliminar;
using Mover.UseCasesPorts.Multimedia.Eliminar;

namespace Mover.UseCases.MultimediaVehiculo.Eliminar
{
    public class EliminarMultimediaVehiculoInteractor : IEliminarMultiemdiaVehiculoInPutPort
    {
        private readonly IEliminarMultimediaVehiculoOutPutPort eliminarMultimediaVehiculoOutPutPort;
        private readonly IEliminarMultimediaVehiculoRepository eliminarMultimediaVehiculoRepository;

        public EliminarMultimediaVehiculoInteractor(IEliminarMultimediaVehiculoOutPutPort eliminarMultimediaVehiculoOutPutPort, IEliminarMultimediaVehiculoRepository eliminarMultimediaVehiculoRepository)
        {
            this.eliminarMultimediaVehiculoOutPutPort = eliminarMultimediaVehiculoOutPutPort;
            this.eliminarMultimediaVehiculoRepository = eliminarMultimediaVehiculoRepository;
        }

        public async Task Handle(int idMultimediaVehiculo)
        {
            var result = await this.eliminarMultimediaVehiculoRepository.Eliminar(idMultimediaVehiculo);

            await this.eliminarMultimediaVehiculoOutPutPort.Handle(result);
        }
    }
}
