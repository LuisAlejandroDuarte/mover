using Mover.Entities.Interfaces.Multimedia.Listar;
using Mover.UseCasesPorts.Multimedia.Lista;

namespace Mover.UseCases.MultimediaVehiculo.Listar
{
    public class ListarMultimediaVehiculoInteractor: IListaMultimediaVehiculoInPutPort
    {
        private readonly IListaMultimediaVehiculoOutPutPort listaMultimediaVehiculoOutPutPort;

        private readonly IListarMultimediaVehiculoRepository listarMultimediaVehiculoRepository;

        public ListarMultimediaVehiculoInteractor(IListaMultimediaVehiculoOutPutPort listaMultimediaVehiculoOutPutPort, IListarMultimediaVehiculoRepository listarMultimediaVehiculoRepository)
        {
            this.listaMultimediaVehiculoOutPutPort = listaMultimediaVehiculoOutPutPort;
            this.listarMultimediaVehiculoRepository = listarMultimediaVehiculoRepository;
        }

        public async Task Handle(int idVehiculo)
        {
            var result = await this.listarMultimediaVehiculoRepository.ListaMultimediaVehciulo(idVehiculo);

            await this.listaMultimediaVehiculoOutPutPort.Handle(result);

        }
    }
}
