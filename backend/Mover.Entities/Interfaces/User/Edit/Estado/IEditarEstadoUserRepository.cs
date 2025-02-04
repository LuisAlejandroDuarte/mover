
using Mover.DTO.User;

namespace Mover.Entities.Interfaces.User.Edit.Estado
{
    public interface IEditarEstadoUserRepository
    {
        UserDTO EditarEstadoUser(UserDTO userDTO);
    }
}
