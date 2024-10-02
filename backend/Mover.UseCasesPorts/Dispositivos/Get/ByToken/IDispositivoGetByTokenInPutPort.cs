namespace Mover.UseCasesPorts.Dispositivos.Get.ByToken
{
    public interface IDispositivoGetByTokenInPutPort
    {
        Task Handle(string token);
    }
}
