using Mover.DTO.Login;

namespace Mover.UseCasesPorts.Login
{
    public interface ILoginInPutPort
    {
        Task Handle(LoginDTO login);
    }
}
