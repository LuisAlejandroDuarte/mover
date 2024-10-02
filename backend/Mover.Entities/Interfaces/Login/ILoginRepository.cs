using Mover.DTO.Login;
using Mover.DTO.User;


namespace Mover.Entities.Interfaces.Login
{
    public interface ILoginRepository
    {
        UserDTO Login(LoginDTO login);
    }
}
