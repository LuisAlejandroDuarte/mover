
using AutoMapper;
using Mover.DTO.Equipo;
using Mover.Entities.Interfaces.Equipo.Crear;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Equipo.Crear
{
    public class CrearEquipoRepository:ICrearEquipoRepository
    {
        private readonly MoverContext moverContext;

        private readonly IMapper imapper;
      

        public CrearEquipoRepository(MoverContext moverContext,IMapper mapper)
        {
            this.moverContext = moverContext;
            this.imapper= mapper;
      
        }

        public async Task<int>  Create(EquipoDTO Equipo)
        {
            var Equiponew = this.imapper.Map<Mover.Entities.POCOEntities.Equipo>(Equipo);
            this.moverContext.Add(Equiponew);
            await this.moverContext.SaveChangesAsync();
            return Equiponew.Id;

        }
    }
}
