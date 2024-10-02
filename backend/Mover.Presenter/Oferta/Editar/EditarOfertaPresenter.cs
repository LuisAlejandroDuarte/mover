
using Mover.UseCasesPorts.Oferta.Editar;

namespace Mover.Presenter.Oferta.Editar
{
    public class EditarOfertaPresenter : IEditarOfertaOutPutPort, IPresenter<bool>
    {
        public bool Content { get; private set; }

        public Task EditarOferta(bool result)
        {
            Content = result;
            return Task.CompletedTask;
        }
    }
}
