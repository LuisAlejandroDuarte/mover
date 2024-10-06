using Mover.Entities.Interfaces.Georeferencia.Departamento.Get.ByIdPais;
using Mover.UseCasesPorts.Georeferencia.Departamento.Get.ByIdPais;

namespace Mover.UseCases.Georeferencia.Departamento.Get.ByIdPais
{
    public class GetDepartamentoByIdPaisInteractor:IGetDepartamentoByIdPaisInPutPort
    {

        readonly IGetDepartamentoByIdPaisOutPutPort getDepartamentoByIdPaisOutPutPort;
        readonly IGetDepartamentoByIdPaisRepository getDepartamentoByIdPaisRepository;

        public GetDepartamentoByIdPaisInteractor(IGetDepartamentoByIdPaisOutPutPort getDepartamentoByIdPaisOutPutPort, IGetDepartamentoByIdPaisRepository getDepartamentoByIdPaisRepository)
        {
            this.getDepartamentoByIdPaisOutPutPort = getDepartamentoByIdPaisOutPutPort;
            this.getDepartamentoByIdPaisRepository = getDepartamentoByIdPaisRepository;
        }

        public async Task Handle(int paisId)
        {
            var list = await getDepartamentoByIdPaisRepository.GetDepartamentosByIdPais(paisId);

            await getDepartamentoByIdPaisOutPutPort.GetDepartamentoByIdPais(list);
        }
    }
}
