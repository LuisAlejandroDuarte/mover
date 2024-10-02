
using Mover.DTO.Titulos;

namespace Mover.UseCasesPorts.Titulos.List
{
    public interface IListTitulosOutPutPort
    {
        Task GetListaTitulosByTipo(List<TitulosDTO> titulos);
    }
}
