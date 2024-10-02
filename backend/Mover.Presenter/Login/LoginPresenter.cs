using Mover.DTO.User;
using Mover.UseCasesPorts.Login;

namespace Mover.Presenter.Login
{
    public class LoginPresenter : ILoginOutPutPort, IPresenter<UserDTO?>
    {
        public UserDTO? Content { get; private set; }

        public Task Handle(UserDTO user)
        {
            Content = user;
            return Task.CompletedTask;
        }
    }
}
