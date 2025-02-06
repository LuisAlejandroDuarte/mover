using Mover.DTO.Empresa;
using Mover.UseCasesPorts.Empresa.Crear;

namespace Mover.Presenter.Empresa.Crear
{
    public class EmpresaCrearPresenter : IEmpresaCrearOutPutPort, IPresenter<EmpresaDTO?>
    {
        public EmpresaDTO? Content { get; private set;}

        public Task CrearEmpresa(EmpresaDTO empresa)
        {
            Content = empresa;
            return Task.CompletedTask;
        }
    }
}
