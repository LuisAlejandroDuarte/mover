
using Mover.Entities.Interfaces.EstadoOferta;
using Mover.UseCasesPorts.EstadoOferta;

namespace Mover.UseCases.EstadoOferta
{
    public class GetAllEstadoOfertaInteractor:IGetAllEstadoOfertaInPutPort
    {
        readonly IGetAllEstadoOfertaOutPutPort getAllEstadoOfertaOutPutPort;
        readonly IGetAllEstadoOfertaRepository getAllEstadoOfertaRepository;

        public GetAllEstadoOfertaInteractor(IGetAllEstadoOfertaOutPutPort getAllEstadoOfertaOutPutPort, IGetAllEstadoOfertaRepository getAllEstadoOfertaRepository)
        {
            this.getAllEstadoOfertaOutPutPort = getAllEstadoOfertaOutPutPort;
            this.getAllEstadoOfertaRepository = getAllEstadoOfertaRepository;
        }

        public async Task Handle()
        {
            var lista = await getAllEstadoOfertaRepository.GetAllEstadoOferta();
            await getAllEstadoOfertaOutPutPort.GetAllEstadoOferta(lista);
        }
    }
}
