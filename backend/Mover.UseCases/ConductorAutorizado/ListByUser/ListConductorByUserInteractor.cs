using Mover.DTO.ConductorAutorizado;
using Mover.Entities.Interfaces.ConductorAutorizado.ListarByUser;
using Mover.UseCasesPorts.ConductorAutorizado.ListaByUser;

namespace Mover.UseCases.ConductorAutorizado.ListByUser
{
    public class ListConductorByUserInteractor:IListaConductorByUserInPutPort
    {
        private readonly IListaConductorByUserOutPutPort listaConductorByUserOut;
        private readonly IListarConductorByUserRepository conductorByUserRepository;

        public ListConductorByUserInteractor(IListaConductorByUserOutPutPort listaConductorByUserOut, IListarConductorByUserRepository conductorByUserRepository)
        {
            this.listaConductorByUserOut = listaConductorByUserOut;
            this.conductorByUserRepository = conductorByUserRepository;
        }

        public async Task Handle(int IdUSer)
        {
            List<ConductorAutorizadoDTO> listConductor = await this.conductorByUserRepository.GetListEquipoByUser(IdUSer);

            await this.listaConductorByUserOut.GetListaOfertaByUser(listConductor);
        }
    }
}
