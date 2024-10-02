

using Mover.DTO.Vehiculos;
using Mover.Entities.Interfaces.Vehiculo.ListaByOferta;
using Mover.UseCasesPorts.Vehiculo.ListByOferta;

namespace Mover.UseCases.Vehiculo.ListByOferta
{
    public class ListaVehiculoByOfertaInteractor : IListaVehiculoByOfertaInPutPort
    {

        readonly IListaVehiculoByOfertaOutPutPort listaVehiculoByOfertaOutPutPort;
        readonly IListaVehiculoByOfertaRepository listaVehiculoByOfertaRepository;

        public ListaVehiculoByOfertaInteractor(IListaVehiculoByOfertaOutPutPort listaVehiculoByOfertaOutPutPort, IListaVehiculoByOfertaRepository listaVehiculoByOfertaRepository)
        {
            this.listaVehiculoByOfertaOutPutPort = listaVehiculoByOfertaOutPutPort;
            this.listaVehiculoByOfertaRepository = listaVehiculoByOfertaRepository;
        }

        public async Task Handle(int IdOferta)
        {
          List<VehiculoDTO> vehiculos=  await listaVehiculoByOfertaRepository.GetListaVehiculoByOferta(IdOferta);

          await listaVehiculoByOfertaOutPutPort.GetListaVehiculoByOferta(vehiculos);
        }
    }
}
