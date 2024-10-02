using Mover.DTO.User;

namespace Mover.Entities.Interfaces.User.Crear
{
    public interface ICreearUserRepository
    {
        UserDTO Create(UserDTO user);

    }
}
