using Mover.DTO.User;

namespace Mover.UseCasesPorts.User.Crear
{
    public interface IUserCrearInPutPort
    {
        Task Handle(UserDTO user);

    }
}
