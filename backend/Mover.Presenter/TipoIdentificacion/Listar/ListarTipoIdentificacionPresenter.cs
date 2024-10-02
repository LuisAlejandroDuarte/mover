
using Mover.DTO.TipoIdentificacion;
using Mover.UseCasesPorts.TipoIdentificacion.Listar;
namespace Mover.Presenter.TipoIdentificacion.Listar
{
    public class ListarTipoIdentificacionPresenter : ITipoIdentificaionOutPutPort, IPresenter<List<TipoIdentificacionDTO>?>
    {
        public List<TipoIdentificacionDTO>? Content { get; private set; }        

        public Task GetListaTipoIdentificacion(List<TipoIdentificacionDTO> tipoIdentificacion)
        {
            Content = tipoIdentificacion;
            return Task.CompletedTask;
        }
    }
}

