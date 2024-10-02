
using Mover.Entities.Interfaces.Clase.Get.ByIdCategoria;
using Mover.UseCasesPorts.Clase.Get.ByIdCategoria;

namespace Mover.UseCases.Clase.Get.ByIdCategoria
{
    public class GetClaseByIdCategoriaInteractor:IGetClaseByIdCategoriaInPutPort
    {
        readonly IGetClaseByIdCategoriaOutPutPort getClaseByIdCategoriaOutPutPort;
        readonly IGetClaseByIdCategoriaRepository getClaseByIdCategoriaRepository;

        public GetClaseByIdCategoriaInteractor(IGetClaseByIdCategoriaOutPutPort getClaseByIdCategoriaOutPutPort, IGetClaseByIdCategoriaRepository getClaseByIdCategoriaRepository)
        {
            this.getClaseByIdCategoriaOutPutPort = getClaseByIdCategoriaOutPutPort;
            this.getClaseByIdCategoriaRepository = getClaseByIdCategoriaRepository;
        }

        public async Task Handle(int idCategoria)
        {
          var  listClase = await  getClaseByIdCategoriaRepository.GetClaseByIdCategoria(idCategoria);
          await getClaseByIdCategoriaOutPutPort.GetClaseByIdCategoria(listClase);
        }
    }
}
