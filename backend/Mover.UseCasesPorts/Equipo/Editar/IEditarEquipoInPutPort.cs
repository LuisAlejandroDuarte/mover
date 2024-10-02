

using Mover.DTO.Equipo;

namespace Mover.UseCasesPorts.Equipo.Editar
{
    public interface IEditarEquipoInPutPort
    {
        Task Handle(EquipoDTO equipoDTO);
    }
}
