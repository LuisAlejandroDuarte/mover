using Mover.Entities.Interfaces.ConductorAutorizado.Eliminar;
using Mover.UseCasesPorts.ConductorAutorizado.Eliminar;

namespace Mover.UseCases.ConductorAutorizado.Eliminar
{
    public class EliminarConductorInteractor:IEliminarConductorInPutPort
    {
        private readonly IEliminarConductorOutPutPort conductorOutPutPort;
        private readonly IEliminarConductorRepository conductorRepository;

        public EliminarConductorInteractor(IEliminarConductorOutPutPort conductorOutPutPort, IEliminarConductorRepository conductorRepository)
        {
            this.conductorOutPutPort = conductorOutPutPort;
            this.conductorRepository = conductorRepository;
        }

        public async Task Handle(int id)
        {
             bool result=   await this.conductorRepository.EliminarConductor(id);

            await this.conductorOutPutPort.EliminarConductor(result);
        }
    }
}
