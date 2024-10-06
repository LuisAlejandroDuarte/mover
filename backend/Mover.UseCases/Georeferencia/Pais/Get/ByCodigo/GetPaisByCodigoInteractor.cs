
using Mover.Entities.Interfaces.Georeferencia.Pais.Get.ByCodigo;
using Mover.UseCasesPorts.Georeferencia.Pais.Get.ByCodigo;

namespace Mover.UseCases.Georeferencia.Pais.Get.ByCodigo
{
    public class GetPaisByCodigoInteractor:IGetPaisByCodigoInPutPort
    {
        readonly IGetPaisByCodigoRepository getPaisByCodigoRepository;

        readonly IGetPaisByCodigoOutPutPort getPaisByIdCodigoOutPutPort;

        public GetPaisByCodigoInteractor(IGetPaisByCodigoRepository getPaisByCodigoRepository, IGetPaisByCodigoOutPutPort getPaisByIdCodigoOutPutPort)
        {
            this.getPaisByCodigoRepository = getPaisByCodigoRepository;
            this.getPaisByIdCodigoOutPutPort = getPaisByIdCodigoOutPutPort;
        }

        public async Task Handle(string codigo)
        {
            var pais = await getPaisByCodigoRepository.GetPaisByCodigo(codigo);

            await getPaisByIdCodigoOutPutPort.GetPaisByIdCodigo(pais);
        }
    }
}
