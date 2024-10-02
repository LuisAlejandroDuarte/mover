using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Login;
using Mover.DTO.User;
using Mover.Presenter;
using Mover.UseCasesPorts.Login;


namespace Mover.Controllers.Login
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController
    {
        readonly ILoginInPutPort InputPort;
        readonly ILoginOutPutPort OutputPort;

        public LoginController(ILoginInPutPort inputPort, ILoginOutPutPort outputPort)
        {
            InputPort = inputPort;
            OutputPort = outputPort;
        }

        [HttpPost]
        public async Task<UserDTO> Login(LoginDTO login)
        {
            await InputPort.Handle(login);
            return ((IPresenter<UserDTO>)OutputPort).Content;
        }
    }
}
