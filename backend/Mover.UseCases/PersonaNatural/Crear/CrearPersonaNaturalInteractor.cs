
using Mover.DTO.PersonaNatural;
using Mover.Entities.Interfaces.PersonaNatural.Crear;
using Mover.UseCasesPorts.PersonaNatural.Crear;

namespace Mover.UseCases.PersonaNatural.Crear
{
    public class CrearPersonaNaturalInteractor : IPersonaNaturalCrearInPutPort
    {
        private readonly ICrearPersonaNaturalRepository crearPersonaNaturalRepository;
        private readonly IPersonaNaturalCrearOutPutPort personaNaturalCrearOutPutPort;

        public CrearPersonaNaturalInteractor(ICrearPersonaNaturalRepository crearPersonaNaturalRepository, IPersonaNaturalCrearOutPutPort personaNaturalCrearOutPutPort)
        {
            this.crearPersonaNaturalRepository = crearPersonaNaturalRepository;
            this.personaNaturalCrearOutPutPort = personaNaturalCrearOutPutPort;
        }

        public async Task Handle(PersonaNaturalDTO personaNatural)
        {
            var result =await  this.crearPersonaNaturalRepository.CrearPersonaNatural(personaNatural);

            await this.personaNaturalCrearOutPutPort.CrearPersonaNatural(result);
        }
    }
}
