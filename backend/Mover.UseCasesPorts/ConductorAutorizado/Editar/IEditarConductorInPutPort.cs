using Mover.DTO.ConductorAutorizado;

namespace Mover.UseCasesPorts.ConductorAutorizado.Editar
{
    public interface IEditarConductorInPutPort
    {
        Task Handle(ConductorAutorizadoDTO conductorAutorizadoDTO);
    }
}
