using Mover.DTO.User;

namespace Mover.UseCasesPorts.User.Crear
{
    public interface IUserCrearOutPutPort
    {
        Task CrearUser(UserDTO user);
    }
}
