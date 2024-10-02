
namespace Mover.Entities.Interfaces
{
    public interface IUnitOfWork
    {
        Task<int> SaveChanges();
    }
}
