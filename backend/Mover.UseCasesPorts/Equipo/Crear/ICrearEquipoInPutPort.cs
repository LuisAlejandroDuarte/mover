
using Mover.DTO.Equipo;
namespace Mover.UseCasesPorts.Equipo.Crear
{
    public interface ICrearEquipoInPutPort
    {
        Task Handle(EquipoDTO equipoDTO);
    }
}
