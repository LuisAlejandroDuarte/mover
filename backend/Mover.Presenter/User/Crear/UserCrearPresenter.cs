using Mover.DTO.User;
using Mover.Entities.POCOEntities;
using Mover.UseCasesPorts.User.Crear;

namespace Mover.Presenter.User.Crear
{
    public class UserCrearPresenter : IUserCrearOutPutPort, IPresenter<UserDTO?>
    {
        public UserDTO? Content { get; private set; }

        public Task CrearUser(UserDTO user)
        {
            Content = user;
            return Task.CompletedTask;
        }
    }
}
