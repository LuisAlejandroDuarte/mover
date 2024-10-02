

using Mover.DTO.Vehiculos;

namespace Mover.Entities.Interfaces.Vehiculo.ListaByOferta
{
    public interface IListaVehiculoByOfertaRepository
    {
        Task<List<VehiculoDTO>> GetListaVehiculoByOferta(int IdOferta);
    }
}
