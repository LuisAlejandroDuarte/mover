
using Mover.DTO.Vehiculos;

namespace Mover.UseCasesPorts.Vehiculo.ListByOferta
{
    public interface IListaVehiculoByOfertaOutPutPort
    {
        Task GetListaVehiculoByOferta(List<VehiculoDTO> vehiculos);
    }
}
