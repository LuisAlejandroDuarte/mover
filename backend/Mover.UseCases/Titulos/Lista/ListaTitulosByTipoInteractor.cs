
using Mover.DTO.Titulos;
using Mover.Entities.Interfaces.Titulos.Listar;
using Mover.UseCasesPorts.Titulos.List;

namespace Mover.UseCases.Titulos.Lista
{
    public class ListaTitulosByTipoInteractor : IListTitulosInPutPort
    {

        private readonly IListTitulosOutPutPort listTitulosOutPutPort;
        private readonly IListarTiulosByTipoRepository listarTiulosByTipoRepository;

        public ListaTitulosByTipoInteractor(IListTitulosOutPutPort listTitulosOutPutPort, IListarTiulosByTipoRepository listarTiulosByTipoRepository)
        {
            this.listTitulosOutPutPort = listTitulosOutPutPort;
            this.listarTiulosByTipoRepository = listarTiulosByTipoRepository;
        }

        public async Task Handle(string tipo)
        {
            List<TitulosDTO> titulos = await this.listarTiulosByTipoRepository.GetListTitulos(tipo);

            await this.listTitulosOutPutPort.GetListaTitulosByTipo(titulos);
        }
    }
}
