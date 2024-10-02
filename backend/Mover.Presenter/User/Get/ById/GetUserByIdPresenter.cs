
using Mover.DTO.User;
using Mover.UseCasesPorts.User.Get.ById;

namespace Mover.Presenter.User.Get.ById
{
    public class GetUserByIdPresenter : IGetUserByIdOutPutPort, IPresenter<UserDTO?>
    {
        public UserDTO? Content { get; private set; }

        public Task GetUser(UserDTO userDTO)
        {
            Content = userDTO;
            return Task.CompletedTask;
        }
    }
}
