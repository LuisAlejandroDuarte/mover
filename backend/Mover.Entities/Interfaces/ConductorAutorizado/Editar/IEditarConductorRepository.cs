
using Mover.DTO.ConductorAutorizado;

namespace Mover.Entities.Interfaces.ConductorAutorizado.Editar
{
    public interface IEditarConductorRepository
    {        
       Task<bool> EditarConductor(ConductorAutorizadoDTO conductorAutorizadoDTO);        
    }
}
