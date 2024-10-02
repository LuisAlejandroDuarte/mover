

using Mover.Entities.Interfaces.Referencia.Get.ByIdMarca;
using Mover.UseCasesPorts.Referencia.Get.ByIdMarca;

namespace Mover.UseCases.Referencia.Get.ByIdMarca
{
    public class GetReferenciaByIdMarcaInteractor : IGetReferenciaByIdMarcaInPutPort
    {

        readonly IGetReferenciaByIdMarcaRepository getReferenciaByIdMarcaRepository;
        readonly IGetReferenciaByIdMarcaOutPutPort getReferenciaByIdMarcaOutPutPort;

        public GetReferenciaByIdMarcaInteractor(IGetReferenciaByIdMarcaRepository getReferenciaByIdMarcaRepository, IGetReferenciaByIdMarcaOutPutPort getReferenciaByIdMarcaOutPutPort)
        {
            this.getReferenciaByIdMarcaRepository = getReferenciaByIdMarcaRepository;
            this.getReferenciaByIdMarcaOutPutPort = getReferenciaByIdMarcaOutPutPort;
        }

        public async Task Handle(int idMarca)
        {
            var listReferencia = await getReferenciaByIdMarcaRepository.GetReferenciaByIdMarca(idMarca);

            await getReferenciaByIdMarcaOutPutPort.GetReferenciaByIdMarca(listReferencia);
        }
    }
}
