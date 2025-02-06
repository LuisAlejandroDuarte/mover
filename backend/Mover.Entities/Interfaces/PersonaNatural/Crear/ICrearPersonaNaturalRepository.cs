using Mover.DTO.PersonaNatural;
namespace Mover.Entities.Interfaces.PersonaNatural.Crear
{
    public interface ICrearPersonaNaturalRepository
    {
        Task<PersonaNaturalDTO> CrearPersonaNatural(PersonaNaturalDTO personaNatural);
    }
}
