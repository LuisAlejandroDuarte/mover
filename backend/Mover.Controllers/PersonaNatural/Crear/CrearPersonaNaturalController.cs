using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.PersonaNatural;
using Mover.Presenter;
using Mover.UseCasesPorts.PersonaNatural.Crear;

namespace Mover.Controllers.PersonaNatural.Crear
{


    [Route("api/[controller]")]
    [ApiController]
    public class CrearPersonaNaturalController
    {
        readonly IPersonaNaturalCrearInPutPort personaNaturalCrearInPutPort;
        readonly IPersonaNaturalCrearOutPutPort personaNaturalCrearOutPutPort;

        public CrearPersonaNaturalController(IPersonaNaturalCrearInPutPort personaNaturalCrearInPutPort, IPersonaNaturalCrearOutPutPort personaNaturalCrearOutPutPort)
        {
            this.personaNaturalCrearInPutPort = personaNaturalCrearInPutPort;
            this.personaNaturalCrearOutPutPort = personaNaturalCrearOutPutPort;
        }

        [HttpPost]
        [Authorize]
        public async Task<PersonaNaturalDTO> CrearPersonaNatural(PersonaNaturalDTO personaNaturalDTO)
        {
            await this.personaNaturalCrearInPutPort.Handle(personaNaturalDTO);

            return ((IPresenter<PersonaNaturalDTO>)personaNaturalCrearOutPutPort).Content;
        }

    }
}
