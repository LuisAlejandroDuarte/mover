using Mover.DTO.User;

namespace Mover.UseCasesPorts.User.Edit.Estado
{
    public interface IUserEditEstadoOutPutPort
    {            
        Task UserEditEstado(bool result);
    }
}
