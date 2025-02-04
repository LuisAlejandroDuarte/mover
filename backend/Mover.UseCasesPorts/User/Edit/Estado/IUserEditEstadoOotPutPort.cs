using Mover.DTO.User;

namespace Mover.UseCasesPorts.User.Edit.Estado
{
    public interface IUserEditEstadoOotPutPort
    {            
        Task UserEditEstado(UserDTO userDTO);
    }
}
