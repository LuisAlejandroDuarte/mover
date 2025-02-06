
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.User;
using Mover.Presenter;
using Mover.UseCasesPorts.User.Edit.Estado;

namespace Mover.Controllers.User.Edit.Estado
{

    [Route("api/[controller]")]
    [ApiController]
    public class EditarEstadoUserController
    {
        readonly IUserEditEstadoInPutPort userEditEstadoInPutPort;
        readonly IUserEditEstadoOutPutPort userEditEstadoOutPutPort;

        public EditarEstadoUserController(IUserEditEstadoInPutPort userEditEstadoInPutPort, IUserEditEstadoOutPutPort userEditEstadoOutPutPort)
        {
            this.userEditEstadoInPutPort = userEditEstadoInPutPort;
            this.userEditEstadoOutPutPort = userEditEstadoOutPutPort;
        }

        [HttpPut]
        [Authorize]
        public async Task<bool> EditEstadoUser(UserDTO usuario)
        {
            await this.userEditEstadoInPutPort.Handle(usuario);
            return ((IPresenter<bool>)userEditEstadoOutPutPort).Content;

        }
    }
}
