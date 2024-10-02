using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Equipo;
using Mover.Entities.Interfaces.Equipo.Editar;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Equipo.Editar
{
    public class EditarEquipoRepository : IEditarEquipoRepository
    {
        private readonly MoverContext moverContext;

        private readonly IMapper imapper;

        public EditarEquipoRepository(MoverContext moverContext, IMapper imapper)
        {
            this.moverContext = moverContext;
            this.imapper = imapper;
        }

        public async Task<bool> EditarEquipo(EquipoDTO Equipo)
        {
            var Equipobd = await this.moverContext.Equipo.Where(x=>x.Id == Equipo.Id).FirstOrDefaultAsync();
            if (Equipobd != null)
            {
                var Equiponew = this.imapper.Map<Mover.Entities.POCOEntities.Equipo>(Equipo);
                this.moverContext.Update(Equipobd);
                this.moverContext.SaveChanges();
                return true;
            } else
            {
                
                throw new Exception("No existe el Equipo");
            }

        }
    }
}
