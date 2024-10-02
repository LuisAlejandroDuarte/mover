
using Mover.Entities.Interfaces.Oferta.Eliminar;
using Mover.UseCasesPorts.Oferta.Eliminar;


namespace Mover.UseCases.Oferta.Eliminar
{
    public class EliminarOfertaInteractor : IEliminarOfertaInPutPort
    {
        private readonly IEliminarOfertaOutPutPort eliminarOfertaOutPutPort;
        private readonly IEliminarOfertaRepository eliminarOfertaRepository;

        public EliminarOfertaInteractor(IEliminarOfertaOutPutPort eliminarOfertaOutPutPort, IEliminarOfertaRepository eliminarOfertaRepository)
        {
            this.eliminarOfertaOutPutPort = eliminarOfertaOutPutPort;
            this.eliminarOfertaRepository = eliminarOfertaRepository;
        }

        public async Task Handle(int id)
        {
           var result = await eliminarOfertaRepository.EliminarOferta(id);

          await eliminarOfertaOutPutPort.EliminarOferta(result);

        }
    }
}
