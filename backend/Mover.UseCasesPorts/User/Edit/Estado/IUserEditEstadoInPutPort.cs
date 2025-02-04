using Mover.DTO.User;

namespace Mover.UseCasesPorts.User.Edit.Estado
{
    public interface IUserEditEstadoInPutPort
    {
        Task Handle(UserDTO? userDTO);
    }
}
