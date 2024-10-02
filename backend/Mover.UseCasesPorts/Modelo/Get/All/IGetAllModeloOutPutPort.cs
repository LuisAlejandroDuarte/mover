
using Mover.DTO.Vehiculos;

namespace Mover.UseCasesPorts.Modelo.Get.All
{
    public interface IGetAllModeloOutPutPort
    {
        Task GetAllModelo(List<ModeloDTO> listModelo);
    }
}
