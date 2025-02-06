
using Mover.DTO.User;
using Mover.UseCasesPorts.User.Edit.Estado;

namespace Mover.Presenter.User.Edit.Estado
{
    public class UserEditarEstadoPresenter : IUserEditEstadoOutPutPort, IPresenter<bool>
    {
        public bool Content { get; private set; }

        public Task UserEditEstado(bool result)
        {
            Content = result;
            return Task.CompletedTask;
        }
    }
}
