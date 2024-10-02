using Mover.DTO.Equipo;

namespace Mover.Entities.Interfaces.Equipo.ListarByUser
{
    public interface IListarEquipoByUserRepository
    {
        Task<List<EquipoDTO>> GetListEquipoByUser(int idUser);
    }
}
