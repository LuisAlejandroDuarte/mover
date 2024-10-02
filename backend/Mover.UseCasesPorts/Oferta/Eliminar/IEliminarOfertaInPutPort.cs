namespace Mover.UseCasesPorts.Oferta.Eliminar
{
    public interface IEliminarOfertaInPutPort
    {
        Task Handle(int id);
    }
}
