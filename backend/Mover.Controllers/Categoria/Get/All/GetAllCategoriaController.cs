

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Vehiculos;
using Mover.Presenter;
using Mover.UseCasesPorts.Categoria.Get.All;


namespace Mover.Controllers.Categoria.Get.All
{

    [Route("api/[controller]")]
    [ApiController]
    public class GetAllCategoriaController
    {
        private readonly IGetAllCategoriaInPutPort getAllCategoriaInPutPort;
        private readonly IGetAllCategoriaOutPutPort getAllCategoriaOutPutPort;

        public GetAllCategoriaController(IGetAllCategoriaInPutPort getAllCategoriaInPutPort, IGetAllCategoriaOutPutPort getAllCategoriaOutPutPort)
        {
            this.getAllCategoriaInPutPort = getAllCategoriaInPutPort;
            this.getAllCategoriaOutPutPort = getAllCategoriaOutPutPort;
        }


        [HttpGet]
        [Authorize]
        public async Task<List<CategoriaDTO>> GetAllCategoria()
        {
            await getAllCategoriaInPutPort.Handle();

            return ((IPresenter<List<CategoriaDTO>>)getAllCategoriaOutPutPort).Content;

        }
    }
}
