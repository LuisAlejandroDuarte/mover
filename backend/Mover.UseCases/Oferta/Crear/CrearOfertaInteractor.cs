using Mover.DTO.Oferta;
using Mover.Entities.Interfaces;
using Mover.Entities.Interfaces.Oferta.Crear;
using Mover.UseCasesPorts.Oferta.Crear;


namespace Mover.UseCases.Oferta.Crear
{
    public class CrearOfertaInteractor:ICrearOfertaInPutPort
    {
        private readonly ICrearOfertaOutPutPort crearOfertaOutPutPort;
        private readonly ICrearOfertaRepository crearOfertaRepository;
        private readonly IUnitOfWork unitOfWork;
        public CrearOfertaInteractor(ICrearOfertaOutPutPort crearOfertaOutPutPort, ICrearOfertaRepository crearOfertaRepository, IUnitOfWork unitOfWork)
        {
            this.crearOfertaOutPutPort = crearOfertaOutPutPort;
            this.crearOfertaRepository = crearOfertaRepository;
            this.unitOfWork = unitOfWork;
        }
                
        public async Task Handle(OfertaDTO oferta)
        {
            int result= await crearOfertaRepository.CrearOferta(oferta);
            
            await this.crearOfertaOutPutPort.CrearOferta(result);
        }
    }
}
