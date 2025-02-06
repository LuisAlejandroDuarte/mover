
using Mover.DTO.Empresa;

namespace Mover.Entities.Interfaces.Empresa.Crear
{
    public interface IEmpresaCrearRepository
    {
        Task<EmpresaDTO> CrearEmpresa(EmpresaDTO empresa);
    }
}
