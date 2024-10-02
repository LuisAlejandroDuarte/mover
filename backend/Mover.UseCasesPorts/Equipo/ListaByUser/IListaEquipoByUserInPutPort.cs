
namespace Mover.UseCasesPorts.Equipo.ListaByUser
{
    public interface IListaEquipoByUserInPutPort
    {
        Task Handle(int IdUSer);
    }
}
