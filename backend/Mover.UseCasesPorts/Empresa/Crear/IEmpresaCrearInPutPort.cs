
using Mover.DTO.Empresa;

namespace Mover.UseCasesPorts.Empresa.Crear
{
    public interface IEmpresaCrearInPutPort
    {
        Task Handle(EmpresaDTO empresa);
    }
}
