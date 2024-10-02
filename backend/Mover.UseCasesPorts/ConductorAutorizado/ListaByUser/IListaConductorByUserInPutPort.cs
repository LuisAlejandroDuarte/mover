
namespace Mover.UseCasesPorts.ConductorAutorizado.ListaByUser
{
    public interface IListaConductorByUserInPutPort
    {
        Task Handle(int IdUSer);
    }
}
