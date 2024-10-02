

using Mover.DTO.ConductorAutorizado;

namespace Mover.UseCasesPorts.ConductorAutorizado.Crear
{
    public interface ICrearConductorInPutPort
    {
        Task Handle(ConductorAutorizadoDTO conductorAutorizadoDTO);
    }
}
