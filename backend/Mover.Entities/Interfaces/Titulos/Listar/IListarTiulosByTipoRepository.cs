
using Mover.DTO.Titulos;

namespace Mover.Entities.Interfaces.Titulos.Listar
{
    public interface IListarTiulosByTipoRepository
    {
        Task<List<TitulosDTO>> GetListTitulos(string tipo);
    }
}
