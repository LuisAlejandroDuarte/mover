
using AutoMapper;
using Mover.DTO.ConductorAutorizado;
using Mover.Entities.Interfaces.ConductorAutorizado.Crear;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Conductor.Crear
{
    public class CrearConductorRepository: ICrearConductorRepository
    {
        private readonly MoverContext moverContext;

        private readonly IMapper imapper;
      

        public CrearConductorRepository(MoverContext moverContext,IMapper mapper)
        {
            this.moverContext = moverContext;
            this.imapper= mapper;
      
        }

        public async Task<int>  Create(ConductorAutorizadoDTO Conductor)
        {
            var Conductornew = this.imapper.Map<Mover.Entities.POCOEntities.ConductorAutorizado>(Conductor);
            this.moverContext.Add(Conductornew);
            await this.moverContext.SaveChangesAsync();
            return Conductornew.Id;
        }
    }
}
