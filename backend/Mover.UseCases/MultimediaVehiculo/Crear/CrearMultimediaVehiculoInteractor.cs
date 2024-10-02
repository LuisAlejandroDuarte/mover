using Mover.DTO.Multimedia;
using Mover.Entities.Interfaces.Multimedia.Crear;
using Mover.UseCasesPorts.Multimedia.Crear;


namespace Mover.UseCases.MultimediaVehiculo.Crear
{
    public class CrearMultimediaVehiculoInteractor : IMultimediaVehiculoInPutPort
    {
        private readonly IMultimediaVehiculoOutPutPort multimediaVehiculoOutPutPort;
        private readonly ICrearMultimediaVehiculoRepository crearMultimediaVehiculoRepository;       
        public CrearMultimediaVehiculoInteractor(IMultimediaVehiculoOutPutPort multimediaVehiculoOutPutPort, ICrearMultimediaVehiculoRepository crearMultimediaVehiculoRepository)
        {
            this.multimediaVehiculoOutPutPort = multimediaVehiculoOutPutPort;
            this.crearMultimediaVehiculoRepository = crearMultimediaVehiculoRepository;
        } 

        public async Task Handle(MultimediaVehiculoDTO multimediaVehiculoDTO)
        {
            var result = await this.crearMultimediaVehiculoRepository.Create(multimediaVehiculoDTO);

            await this.multimediaVehiculoOutPutPort.Handle(result);
        }
    }
}
