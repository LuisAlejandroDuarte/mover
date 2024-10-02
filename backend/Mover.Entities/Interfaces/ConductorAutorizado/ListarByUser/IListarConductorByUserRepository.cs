using Mover.DTO.ConductorAutorizado;

namespace Mover.Entities.Interfaces.ConductorAutorizado.ListarByUser
{
    public interface IListarConductorByUserRepository
    {
        Task<List<ConductorAutorizadoDTO>> GetListEquipoByUser(int idUser);
    }
}
