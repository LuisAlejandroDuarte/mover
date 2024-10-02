
using Mover.DTO.Equipo;

namespace Mover.Entities.Interfaces.Equipo.Editar
{
    public interface IEditarEquipoRepository
    {        
       Task<bool> EditarEquipo(EquipoDTO equipo);        
    }
}
