using Mover.Entities.Interfaces.TipoIdentificacion.Listar;
using Mover.UseCasesPorts.TipoIdentificacion.Listar;
using Mover.DTO.TipoIdentificacion;
namespace Mover.UseCases.TipoIdentificacion.Listar
{
    public class ListarTipoIdentificacionInteractor : ITipoIdentificaionInPutPort
    {
        private readonly ITipoIdentificaionOutPutPort  tipoIdentificaionOutPutPort;
        private readonly IListarTipoIdentificacionRepository  listarTipoIdentificacionRepository;

        public ListarTipoIdentificacionInteractor(IListarTipoIdentificacionRepository listarTipoIdentificacionRepository, ITipoIdentificaionOutPutPort tipoIdentificaionOutPutPort)
        {
            this.listarTipoIdentificacionRepository = listarTipoIdentificacionRepository;
            this.tipoIdentificaionOutPutPort = tipoIdentificaionOutPutPort;
        }

        public async Task Handle()
        {
            List<TipoIdentificacionDTO> tipoIdentificaciones = await this.listarTipoIdentificacionRepository.GetTipoIdentificacion();

            await this.tipoIdentificaionOutPutPort.GetListaTipoIdentificacion(tipoIdentificaciones);
        }
    }
}
