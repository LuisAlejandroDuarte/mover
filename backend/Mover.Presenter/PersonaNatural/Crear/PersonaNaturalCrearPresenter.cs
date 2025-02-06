
using Mover.DTO.PersonaNatural;
using Mover.UseCasesPorts.PersonaNatural.Crear;

namespace Mover.Presenter.PersonaNatural.Crear
{
    public class PersonaNaturalCrearPresenter : IPersonaNaturalCrearOutPutPort, IPresenter<PersonaNaturalDTO?>
    {
        public PersonaNaturalDTO? Content { get; private set; }

        public Task CrearPersonaNatural(PersonaNaturalDTO personaNatural)
        {
           Content =personaNatural;
            return Task.CompletedTask;
        }
    }
}
