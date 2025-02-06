
using Mover.DTO.User;

namespace Mover.Entities.Interfaces.User.Edit.Estado
{
    public interface IUserEditarEstadoRepository
    {
        bool EditarEstadoUser(UserDTO? userDTO);
    }
}
