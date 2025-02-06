using Mover.DTO.User;
using Mover.Entities.Interfaces.User.Edit.Estado;
using Mover.UseCasesPorts.User.Edit.Estado;

namespace Mover.UseCases.User.Edit.Estado
{
    public class EditarEstadoUserInteractor : IUserEditEstadoInPutPort
    {

        private readonly IUserEditEstadoOutPutPort userEditEstadoOutPutPort;
        private readonly IUserEditarEstadoRepository userEditarEstadoRepository;

        public EditarEstadoUserInteractor(IUserEditEstadoOutPutPort userEditEstadoOutPutPort, IUserEditarEstadoRepository userEditarEstadoRepository)
        {
            this.userEditEstadoOutPutPort = userEditEstadoOutPutPort;
            this.userEditarEstadoRepository = userEditarEstadoRepository;
        }

        public async Task Handle(UserDTO? userDTO)
        {
            var result =   this.userEditarEstadoRepository.EditarEstadoUser(userDTO);

            await this.userEditEstadoOutPutPort.UserEditEstado(result);
        }
    }
}
