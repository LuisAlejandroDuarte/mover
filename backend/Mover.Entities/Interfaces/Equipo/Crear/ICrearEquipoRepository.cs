using Mover.DTO.Equipo;
namespace Mover.Entities.Interfaces.Equipo.Crear
{
    public interface ICrearEquipoRepository
    {
        Task<int> Create(EquipoDTO equipoDTO);
    }    
}
