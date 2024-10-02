
namespace Mover.UseCasesPorts.Oferta.ListaByUser
{
    public interface IListaOfertaByUserInPutPort
    {
        Task Handle(int IdUSer);
    }
}
