
using Mover.DTO.Oferta;
using Mover.Entities.Interfaces.Oferta.ListaByUser;
using Mover.UseCasesPorts.Oferta.ListaByUser;

namespace Mover.UseCases.Oferta.ListaByUser
{
    public class ListaOfertaByUserInteractor : IListaOfertaByUserInPutPort
    {

        private readonly IListaOfertaByUserOutPutPort listaOfertaByUserOutPutPort;
        private readonly IListaOfertaByUserRepository listaOfertaByUserRepository;

        public ListaOfertaByUserInteractor(IListaOfertaByUserOutPutPort listaOfertaByUserOutPutPort, IListaOfertaByUserRepository listaOfertaByUserRepository)
        {
            this.listaOfertaByUserOutPutPort = listaOfertaByUserOutPutPort;
            this.listaOfertaByUserRepository = listaOfertaByUserRepository;
        }

        public async Task Handle(int IdUSer)
        {
            List<OfertaDTO> ofertas =await this.listaOfertaByUserRepository.GetListaOfertaByUser(IdUSer);

           await this.listaOfertaByUserOutPutPort.GetListaOfertaByUser(ofertas);
        }
    }
}
