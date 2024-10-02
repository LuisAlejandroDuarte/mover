
namespace Mover.UseCasesPorts.Titulos.List
{
    public interface IListTitulosInPutPort
    {
        Task Handle(string tipo);
    }
}
