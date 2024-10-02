using Mover.DTO.Oferta;

namespace Mover.Entities.Interfaces.Oferta.Editar
{
    public interface IEditarOfertaRepository
    {
        Task<bool> EditarOferta(OfertaDTO oferta);
    }
}
