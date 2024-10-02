
using Mover.DTO.ConductorAutorizado;
using Mover.Entities.Interfaces.ConductorAutorizado.Crear;
using Mover.UseCasesPorts.ConductorAutorizado.Crear;

namespace Mover.UseCases.ConductorAutorizado.Crear
{
    public class CrearConductorInteractor : ICrearConductorInPutPort
    {

        private readonly ICrearConductorOutPutPort outPutPort;
        private readonly  ICrearConductorRepository conductorRepository;

        public CrearConductorInteractor(ICrearConductorOutPutPort outPutPort, ICrearConductorRepository conductorRepository)
        {
            this.outPutPort = outPutPort;
            this.conductorRepository = conductorRepository;
        }

        public async Task Handle(ConductorAutorizadoDTO conductorAutorizadoDTO)
        {
            int result = await conductorRepository.Create(conductorAutorizadoDTO);

            await this.outPutPort.CrearConductor(result);
        }
    }
}
