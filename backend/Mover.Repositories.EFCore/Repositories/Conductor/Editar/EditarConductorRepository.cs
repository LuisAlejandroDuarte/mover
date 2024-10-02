using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.ConductorAutorizado;
using Mover.Entities.Interfaces.ConductorAutorizado.Editar;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.ConductorAutorizado.Editar
{
    public class EditarConductorRepository : IEditarConductorRepository
    {
        private readonly MoverContext moverContext;

        private readonly IMapper imapper;

        public EditarConductorRepository(MoverContext moverContext, IMapper imapper)
        {
            this.moverContext = moverContext;
            this.imapper = imapper;
        }

        public async Task<bool> EditarConductor(ConductorAutorizadoDTO Conductor)
        {
            var Conductorbd = await this.moverContext.ConductorAutorizado.Where(x=>x.Id == Conductor.Id).FirstOrDefaultAsync();
            if (Conductorbd != null)
            {
                var Conductornew = this.imapper.Map<Mover.Entities.POCOEntities.ConductorAutorizado>(Conductor);
                this.moverContext.Update(Conductorbd);
                this.moverContext.SaveChanges();
                return true;
            } else
            {
                
                throw new Exception("No existe el Conductor");
            }

        }
    }
}
