using Mover.Entities.Interfaces.Categoria.Get.All;
using Mover.UseCasesPorts.Categoria.Get.All;

namespace Mover.UseCases.Categoria.Get.All
{
    public class GetAllCategoriaInteractor: IGetAllCategoriaInPutPort
    {
        readonly IGetAllCategoriaOutPutPort getAllCategoriaOutPutPort;
        readonly IGetAllCategoriaRepository getAllCategoriaRepository;

        public GetAllCategoriaInteractor(IGetAllCategoriaOutPutPort getAllCategoriaOutPutPort, IGetAllCategoriaRepository getAllCategoriaRepository)
        {
            this.getAllCategoriaOutPutPort = getAllCategoriaOutPutPort;
            this.getAllCategoriaRepository = getAllCategoriaRepository;
        }

        public async Task Handle()
        {
            var listCategoria = await getAllCategoriaRepository.GetAllCategoria();

            await getAllCategoriaOutPutPort.GetAllCategoria(listCategoria);
        }
    }
}
