
namespace Mover.Entities.Interfaces.Oferta.Eliminar
{
    public interface IEliminarOfertaRepository
    {
        Task<bool> EliminarOferta(int id);
    }
}
