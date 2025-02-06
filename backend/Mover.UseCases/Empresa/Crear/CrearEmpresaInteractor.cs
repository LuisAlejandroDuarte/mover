
using Mover.DTO.Empresa;
using Mover.Entities.Interfaces.Empresa.Crear;
using Mover.UseCasesPorts.Empresa.Crear;

namespace Mover.UseCases.Empresa.Crear
{
    public class CrearEmpresaInteractor : IEmpresaCrearInPutPort
    {
        private readonly IEmpresaCrearOutPutPort  empresaCrearOutPutPort;
        private readonly IEmpresaCrearRepository empresaCrearRepository;

        public CrearEmpresaInteractor(IEmpresaCrearOutPutPort empresaCrearOutPutPort, IEmpresaCrearRepository empresaCrearRepository)
        {
            this.empresaCrearOutPutPort = empresaCrearOutPutPort;
            this.empresaCrearRepository = empresaCrearRepository;
        }

        public async Task Handle(EmpresaDTO empresa)
        {
            var reault = await this.empresaCrearRepository.CrearEmpresa(empresa);

            await this.empresaCrearOutPutPort.CrearEmpresa(reault);
        }
    }
}
