using Mover.DTO.ConductorAutorizado;
using Mover.Entities.Interfaces.ConductorAutorizado.Editar;
using Mover.UseCasesPorts.ConductorAutorizado.Editar;

namespace Mover.UseCases.ConductorAutorizado.Editar
{
    public class EditarConductorInteractor:IEditarConductorInPutPort
    {
        private readonly IEditarConductorOutPutPort conductorOutPutPort;
        private readonly IEditarConductorRepository conductorRepository;

        public EditarConductorInteractor(IEditarConductorOutPutPort conductorOutPutPort, IEditarConductorRepository conductorRepository)
        {
            this.conductorOutPutPort = conductorOutPutPort;
            this.conductorRepository = conductorRepository;
        }

        public async Task Handle(ConductorAutorizadoDTO conductorAutorizadoDTO)
        {
            bool result = await  this.conductorRepository.EditarConductor(conductorAutorizadoDTO);
            await this.conductorOutPutPort.EditarConductor(result);
        }
    }
}
