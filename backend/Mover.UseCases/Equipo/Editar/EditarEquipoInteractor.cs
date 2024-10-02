using Mover.DTO.Equipo;
using Mover.Entities.Interfaces.Equipo.Editar;
using Mover.UseCasesPorts.Equipo.Editar;

namespace Mover.UseCases.Equipo.Editar
{
    public class EditarEquipoInteractor :IEditarEquipoInPutPort
    {
        private readonly IEditarEquipoOutPutPort editarEquipoOutPutPort;
        private readonly IEditarEquipoRepository editarEquipoRepository;

        public EditarEquipoInteractor(IEditarEquipoOutPutPort editarEquipoOutPutPort, IEditarEquipoRepository editarEquipoRepository)
        {
            this.editarEquipoOutPutPort = editarEquipoOutPutPort;
            this.editarEquipoRepository = editarEquipoRepository;
        }

        public async Task Handle(EquipoDTO Equipo)
        {
           var result = await editarEquipoRepository.EditarEquipo(Equipo);

            await editarEquipoOutPutPort.EditarEquipo(result);
        }
    }
}
