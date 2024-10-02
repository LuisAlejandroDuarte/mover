
using Mover.Entities.Interfaces.Marca.Get.ByIdClase;
using Mover.UseCasesPorts.Marca.Get.ByIdClase;

namespace Mover.UseCases.Marca.ByIdClase
{
    public class GetMarcaByIdClaseInteractor: IGetMarcaByIdClaseInPutPort
    {
        readonly IGetMarcaByIdClaseOutPutPort  getMarcaByIdClaseOutPutPort;
        readonly IGetMarcaByIdClaseRepository  getMarcaByIdClaseRepository;

        public GetMarcaByIdClaseInteractor(IGetMarcaByIdClaseOutPutPort getMarcaByIdClaseOutPutPort, IGetMarcaByIdClaseRepository getMarcaByIdClaseRepository)
        {
            this.getMarcaByIdClaseOutPutPort = getMarcaByIdClaseOutPutPort;
            this.getMarcaByIdClaseRepository = getMarcaByIdClaseRepository;
        }

        public async Task Handle(int idClase)
        {
            var listMarca = await getMarcaByIdClaseRepository.GetMarcaByIdClase(idClase);
            await getMarcaByIdClaseOutPutPort.GetMarcaByIdClase(listMarca);
        }
    }
}
