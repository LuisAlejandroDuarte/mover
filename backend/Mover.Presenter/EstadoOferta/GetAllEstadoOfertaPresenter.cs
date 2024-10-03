
using Mover.DTO.EstadoOferta;
using Mover.UseCasesPorts.EstadoOferta;

namespace Mover.Presenter.EstadoOferta
{
    public class GetAllEstadoOfertaPresenter : IGetAllEstadoOfertaOutPutPort, IPresenter<List<EstadoOfertaDTO>?>
    {
        public List<EstadoOfertaDTO>? Content { get; private set; }

        public  Task GetAllEstadoOferta(List<EstadoOfertaDTO> listEstadoOferta)
        {
            Content = listEstadoOferta;

            return Task.CompletedTask;
        }
    }
}
