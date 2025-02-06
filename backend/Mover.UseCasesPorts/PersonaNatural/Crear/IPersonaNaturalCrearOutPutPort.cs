
using Mover.DTO.PersonaNatural;

namespace Mover.UseCasesPorts.PersonaNatural.Crear
{
    public interface IPersonaNaturalCrearOutPutPort
    {
        Task CrearPersonaNatural(PersonaNaturalDTO personaNatural);
    }
}
