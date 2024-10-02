using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.User;
using Mover.Presenter;
using Mover.UseCasesPorts.User.Crear;

namespace Mover.Controllers.User.Crear
{
    [Route("api/[controller]")]
    [ApiController]
    public class CrearUserController
    {
        readonly IUserCrearInPutPort InputPort;
        readonly IUserCrearOutPutPort OutputPort;

        public CrearUserController(IUserCrearInPutPort inputPort, IUserCrearOutPutPort outputPort)
        {
            InputPort = inputPort;
            OutputPort = outputPort;
        }

        [HttpPost]
        [Authorize]
        public async Task<UserDTO> CrearUser(UserDTO usuario)
        {
            await this.InputPort.Handle(usuario);
            return ((IPresenter<UserDTO>)OutputPort).Content;

        }

    }
}
