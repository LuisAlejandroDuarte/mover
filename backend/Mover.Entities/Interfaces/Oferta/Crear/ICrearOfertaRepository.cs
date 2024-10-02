using Mover.DTO.Oferta;

namespace Mover.Entities.Interfaces.Oferta.Crear
{
    public interface ICrearOfertaRepository
    {
        Task<int> CrearOferta(OfertaDTO oferta);

    }
}
