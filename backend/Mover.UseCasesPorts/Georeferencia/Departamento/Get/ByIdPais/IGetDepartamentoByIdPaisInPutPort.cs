
namespace Mover.UseCasesPorts.Georeferencia.Departamento.Get.ByIdPais
{
    public interface IGetDepartamentoByIdPaisInPutPort
    {
        Task Handle(int paisId);
    }
}
