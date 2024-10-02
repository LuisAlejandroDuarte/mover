namespace Mover.UseCasesPorts.Dispositivos.Crear
{
    public interface ICrearDispositivoOutPutPort
    {
        Task Handle(int? id);
    }
}
