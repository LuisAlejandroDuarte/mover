namespace Mover.UseCasesPorts.Georeferencia.Ciudad.Get.ByIdDepartamento
{
    public interface IGetCiudadByIdDepartamentoInPutPort
    {
        Task Handle(int departamentoId);
    }
}
