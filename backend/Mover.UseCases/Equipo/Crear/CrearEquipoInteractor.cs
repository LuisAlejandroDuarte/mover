
using Mover.DTO.Equipo;
using Mover.Entities.Interfaces;
using Mover.Entities.Interfaces.Equipo.Crear;
using Mover.UseCasesPorts.Equipo.Crear;

namespace Mover.UseCases.Equipo.Crear
{
    public class CrearEquipoInteractor: ICrearEquipoInPutPort
    {
        private readonly ICrearEquipoOutPutPort crearEquipoOutPutPort;
        private readonly ICrearEquipoRepository crearEquipoRepository;
        
        public CrearEquipoInteractor(ICrearEquipoOutPutPort crearEquipoOutPutPort, ICrearEquipoRepository crearEquipoRepository)
        {
            this.crearEquipoOutPutPort = crearEquipoOutPutPort;
            this.crearEquipoRepository = crearEquipoRepository;
        
        }
                
        public async Task Handle(EquipoDTO equipoDTO)
        {
            int result= await crearEquipoRepository.Create(equipoDTO);
            
            await this.crearEquipoOutPutPort.CrearEquipo(result);
        }
        
    }
}
