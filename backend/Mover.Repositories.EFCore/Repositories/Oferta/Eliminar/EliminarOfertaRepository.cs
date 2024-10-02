using Microsoft.EntityFrameworkCore;
using Mover.Entities.Interfaces.Oferta.Eliminar;
using Mover.Repositories.EFCore.DataContext;


namespace Mover.Repositories.EFCore.Repositories.Oferta.Eliminar
{
    public class EliminarOfertaRepository : IEliminarOfertaRepository
    {
        private readonly MoverContext moverContext;

        public EliminarOfertaRepository(MoverContext moverContext)
        {
            this.moverContext = moverContext;
        }

        public async Task<bool> EliminarOferta(int id)
        {
           var oferta= await this.moverContext.Oferta.FirstOrDefaultAsync(x => x.Id == id);
            if (oferta != null) {
                this.moverContext.Oferta.Remove(oferta);
                await this.moverContext.SaveChangesAsync();
            } else
            {
                throw new Exception("No existe la oferta");
            }           

           return true;
        }
    }
}
