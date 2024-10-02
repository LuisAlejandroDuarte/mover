using Mover.DTO.Oferta;

namespace Mover.UseCasesPorts.Oferta.Crear
{
    public interface ICrearOfertaInPutPort
    {
        Task Handle(OfertaDTO oferta);
    }
}
