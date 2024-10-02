using Mover.Entities.Interfaces;
using Mover.Repositories.EFCore.DataContext;
namespace Mover.Repositories.EFCore.Repositories
{
    public class UnitOfWork: IUnitOfWork
    {
        readonly MoverContext Context;

        public UnitOfWork(MoverContext context)
        {
            Context = context;
        }

        public Task<int> SaveChanges()
        {
           
            //Crear Excepciones
            return Context.SaveChangesAsync();
           
        
        }
    }
}
