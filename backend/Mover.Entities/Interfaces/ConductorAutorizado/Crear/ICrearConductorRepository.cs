
using Mover.DTO.ConductorAutorizado;

namespace Mover.Entities.Interfaces.ConductorAutorizado.Crear
{
    public interface ICrearConductorRepository
    {
        Task<int> Create(ConductorAutorizadoDTO  conductorAutorizadoDTO);
    }    
}
