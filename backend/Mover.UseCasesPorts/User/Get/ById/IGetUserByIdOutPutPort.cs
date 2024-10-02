
using Mover.DTO.User;

namespace Mover.UseCasesPorts.User.Get.ById
{
    public interface IGetUserByIdOutPutPort
    {
        Task GetUser(UserDTO userDTO);
    }
}
