
using Mover.DTO.Equipo;
using Mover.Entities.Interfaces.Equipo.ListarByUser;
using Mover.UseCasesPorts.Equipo.ListaByUser;


namespace Mover.UseCases.Equipo.ListaByUser
{
    public class ListaEquipoByUserInteractor : IListaEquipoByUserInPutPort
    {

        private readonly IListaEquipoByUserOutPutPort listaEquipoByUserOutPutPort;
        private readonly IListarEquipoByUserRepository listaEquipoByUserRepository;

        public ListaEquipoByUserInteractor(IListaEquipoByUserOutPutPort listaEquipoByUserOutPutPort, IListarEquipoByUserRepository listaEquipoByUserRepository)
        {
            this.listaEquipoByUserOutPutPort = listaEquipoByUserOutPutPort;
            this.listaEquipoByUserRepository = listaEquipoByUserRepository;
        }

        public async Task Handle(int IdUSer)
        {
            List<EquipoDTO> Equipos =await this.listaEquipoByUserRepository.GetListEquipoByUser(IdUSer);

           await this.listaEquipoByUserOutPutPort.GetListaOfertaByUser(Equipos);
        }
    }
}
