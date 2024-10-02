using Microsoft.EntityFrameworkCore;
using Mover.Entities.Interfaces.ConductorAutorizado.Eliminar;
using Mover.Repositories.EFCore.DataContext;


namespace Mover.Repositories.EFCore.Repositories.Conductor.Eliminar
{
    public class EliminarConductorRepository : IEliminarConductorRepository
    {
        private readonly MoverContext moverContext;

        public EliminarConductorRepository(MoverContext moverContext)
        {
            this.moverContext = moverContext;
        }

        public async Task<bool> EliminarConductor(int id)
        {
           var Conductor= await this.moverContext.ConductorAutorizado.FirstOrDefaultAsync(x => x.Id == id);
            if (Conductor != null) {
                this.moverContext.ConductorAutorizado.Remove(Conductor);
                await this.moverContext.SaveChangesAsync();
            } else
            {
                throw new Exception("No existe el Conductor");
            }           

           return true;
        }
    }
}
