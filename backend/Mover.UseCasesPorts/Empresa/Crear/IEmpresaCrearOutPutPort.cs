

using Mover.DTO.Empresa;

namespace Mover.UseCasesPorts.Empresa.Crear
{
    public interface IEmpresaCrearOutPutPort
    {
        Task CrearEmpresa(EmpresaDTO empresa);
    }
}
