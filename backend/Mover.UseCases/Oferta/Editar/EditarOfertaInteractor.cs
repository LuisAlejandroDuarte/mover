using Mover.DTO.Oferta;
using Mover.Entities.Interfaces.Oferta.Editar;
using Mover.UseCasesPorts.Oferta.Editar;

namespace Mover.UseCases.Oferta.Editar
{
    public class EditarOfertaInteractor :IEditarOfertaInPutPort
    {
        private readonly IEditarOfertaOutPutPort editarOfertaOutPutPort;
        private readonly IEditarOfertaRepository editarOfertaRepository;

        public EditarOfertaInteractor(IEditarOfertaOutPutPort editarOfertaOutPutPort, IEditarOfertaRepository editarOfertaRepository)
        {
            this.editarOfertaOutPutPort = editarOfertaOutPutPort;
            this.editarOfertaRepository = editarOfertaRepository;
        }

        public async Task Handle(OfertaDTO oferta)
        {
           var result = await editarOfertaRepository.EditarOferta(oferta);

            await editarOfertaOutPutPort.EditarOferta(result);
        }
    }
}
