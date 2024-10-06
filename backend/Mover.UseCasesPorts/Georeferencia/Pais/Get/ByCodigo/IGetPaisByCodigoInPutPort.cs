
namespace Mover.UseCasesPorts.Georeferencia.Pais.Get.ByCodigo
{
    public interface IGetPaisByCodigoInPutPort
    {
        Task Handle(string codigo);
    }
}
