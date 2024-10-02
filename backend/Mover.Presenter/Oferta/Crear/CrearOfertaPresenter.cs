using Mover.UseCasesPorts.Oferta.Crear;
namespace Mover.Presenter.Oferta.Crear
{
    public class CrearOfertaPresenter : ICrearOfertaOutPutPort, IPresenter<int>
    {
        public int Content { get; private set; }

        public Task CrearOferta(int Id)
        {
            Content= Id;
            return Task.CompletedTask;
        }
    }
}
