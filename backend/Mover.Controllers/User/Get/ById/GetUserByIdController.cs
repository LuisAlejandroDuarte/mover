
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.User;
using Mover.Presenter;
using Mover.UseCasesPorts.User.Get.ById;

namespace Mover.Controllers.User.Get.ById
{

    [Route("api/[controller]")]
    [ApiController]
    public class GetUserByIdController
    {
        private readonly IGetUserByIdOutPutPort getUserByIdOutPutPort;
        private readonly IGetUserByIdInPutPort getUserByIdInPutPort;

        public GetUserByIdController(IGetUserByIdOutPutPort getUserByIdOutPutPort, IGetUserByIdInPutPort getUserByIdInPutPort)
        {
            this.getUserByIdOutPutPort = getUserByIdOutPutPort;
            this.getUserByIdInPutPort = getUserByIdInPutPort;
        }

        [HttpGet]
        [Authorize]
        public async Task<UserDTO> GetUserById(int id)
        {
            await this.getUserByIdInPutPort.Handle(id);

            return ((IPresenter<UserDTO>)getUserByIdOutPutPort).Content;


        }
    }
}
