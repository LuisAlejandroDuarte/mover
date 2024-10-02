
using Mover.Entities.Interfaces.Equipo.Eliminar;
using Mover.UseCasesPorts.Equipo.Eliminar;


namespace Mover.UseCases.Equipo.Eliminar
{
    public class EliminarEquipoInteractor : IEliminarEquipoInPutPort
    {
        private readonly IEliminarEquipoOutPutPort eliminarEquipoOutPutPort;
        private readonly IEliminarEquipoRepository eliminarEquipoRepository;

        public EliminarEquipoInteractor(IEliminarEquipoOutPutPort eliminarEquipoOutPutPort, IEliminarEquipoRepository eliminarEquipoRepository)
        {
            this.eliminarEquipoOutPutPort = eliminarEquipoOutPutPort;
            this.eliminarEquipoRepository = eliminarEquipoRepository;
        }

        public async Task Handle(int id)
        {
           var result = await eliminarEquipoRepository.EliminarEquipo(id);

          await eliminarEquipoOutPutPort.EliminarEquipo(result);

        }
    }
}
