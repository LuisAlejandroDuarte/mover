

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Empresa;
using Mover.Presenter;
using Mover.UseCasesPorts.Empresa.Crear;

namespace Mover.Controllers.Empresa.Crear
{

    [Route("api/[controller]")]
    [ApiController]
    public class CrearEmpresaController
    {
        readonly IEmpresaCrearInPutPort empresaCrearInPutPort;
        readonly IEmpresaCrearOutPutPort empresaCrearOutPutPort;

        public CrearEmpresaController(IEmpresaCrearInPutPort empresaCrearInPutPort, IEmpresaCrearOutPutPort empresaCrearOutPutPort)
        {
            this.empresaCrearInPutPort = empresaCrearInPutPort;
            this.empresaCrearOutPutPort = empresaCrearOutPutPort;
        }

        [HttpPost]
        [Authorize]
        public async Task<EmpresaDTO> CrearEmpresa(EmpresaDTO empresaDTO)
        {
            await this.empresaCrearInPutPort.Handle(empresaDTO);

            return ((IPresenter<EmpresaDTO>)empresaCrearOutPutPort).Content;
        }

    }
}
