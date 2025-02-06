

using Mover.DTO.PersonaNatural;

namespace Mover.UseCasesPorts.PersonaNatural.Crear
{
    public interface IPersonaNaturalCrearInPutPort
    {
        Task Handle(PersonaNaturalDTO personaNatural);
    }
}
