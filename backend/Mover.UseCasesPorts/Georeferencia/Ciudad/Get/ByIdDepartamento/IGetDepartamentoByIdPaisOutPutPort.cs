using Mover.Entities.POCOEntities.Georeferencia;

namespace Mover.UseCasesPorts.Georeferencia.Ciudad.Get.ByIdDepartamento
{
    public interface IGetCiudadByIdDepartamentoOutPutPort
    {
        Task GetCiudadByIdDepartamento(List<CiudadDTO> listCiudad);
    }
}
