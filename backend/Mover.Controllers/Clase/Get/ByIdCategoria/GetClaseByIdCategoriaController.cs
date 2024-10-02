

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Vehiculos;
using Mover.Presenter;
using Mover.UseCasesPorts.Clase.Get.ByIdCategoria;



namespace Mover.Controllers.Clase.Get.ByIdCategoria
{

    [Route("api/[controller]")]
    [ApiController]
    public class GetClaseByIdCategoriaController
    {
        private readonly IGetClaseByIdCategoriaInPutPort getClaseByIdCategoriaInPutPort;
        private readonly IGetClaseByIdCategoriaOutPutPort getClaseByIdCategoriaOutPutPort;

        public GetClaseByIdCategoriaController(IGetClaseByIdCategoriaInPutPort getClaseByIdCategoriaInPutPort, IGetClaseByIdCategoriaOutPutPort getClaseByIdCategoriaOutPutPort)
        {
            this.getClaseByIdCategoriaInPutPort = getClaseByIdCategoriaInPutPort;
            this.getClaseByIdCategoriaOutPutPort = getClaseByIdCategoriaOutPutPort;
        }


        [HttpGet]
        [Authorize]
        public async Task<List<ClaseDTO>> GetClaseByIdCategoria(int idCategoria)
        {
            await getClaseByIdCategoriaInPutPort.Handle(idCategoria);

            return ((IPresenter<List<ClaseDTO>>)getClaseByIdCategoriaOutPutPort).Content;

        }
    }
}

