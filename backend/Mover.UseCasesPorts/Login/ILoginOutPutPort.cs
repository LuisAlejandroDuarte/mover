using Mover.DTO.User;

namespace Mover.UseCasesPorts.Login
{
    public interface ILoginOutPutPort
    {
        Task Handle(UserDTO user);
    }
}