using Mover.DTO.Oferta;

namespace Mover.UseCasesPorts.Oferta.Editar
{
    public interface IEditarOfertaInPutPort
    {
        Task Handle(OfertaDTO oferta);
    }
}
