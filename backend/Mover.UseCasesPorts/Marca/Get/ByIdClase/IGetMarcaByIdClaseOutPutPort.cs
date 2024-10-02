using Mover.DTO.Vehiculos;

namespace Mover.UseCasesPorts.Marca.Get.ByIdClase
{
    public interface IGetMarcaByIdClaseOutPutPort
    {
        Task GetMarcaByIdClase(List<MarcaDTO> listMarca);
    }
}
