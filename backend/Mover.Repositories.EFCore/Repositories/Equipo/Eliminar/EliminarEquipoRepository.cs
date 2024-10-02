using Microsoft.EntityFrameworkCore;
using Mover.Entities.Interfaces.Equipo.Eliminar;
using Mover.Repositories.EFCore.DataContext;


namespace Mover.Repositories.EFCore.Repositories.Equipo.Eliminar
{
    public class EliminarEquipoRepository : IEliminarEquipoRepository
    {
        private readonly MoverContext moverContext;

        public EliminarEquipoRepository(MoverContext moverContext)
        {
            this.moverContext = moverContext;
        }

        public async Task<bool> EliminarEquipo(int id)
        {
           var Equipo= await this.moverContext.Equipo.FirstOrDefaultAsync(x => x.Id == id);
            if (Equipo != null) {
                this.moverContext.Equipo.Remove(Equipo);
                await this.moverContext.SaveChangesAsync();
            } else
            {
                throw new Exception("No existe el Equipo");
            }           

           return true;
        }
    }
}
