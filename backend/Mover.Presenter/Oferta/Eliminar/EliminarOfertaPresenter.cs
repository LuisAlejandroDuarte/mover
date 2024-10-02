using Mover.UseCasesPorts.Oferta.Eliminar;

namespace Mover.Presenter.Oferta.Eliminar
{
    public class EliminarOfertaPresenter : IEliminarOfertaOutPutPort, IPresenter<bool>
    {
        public bool Content { get; private set; }

        public Task EliminarOferta(bool result)
        {
            Content = result;
            return Task.CompletedTask;
        }
    }
}
