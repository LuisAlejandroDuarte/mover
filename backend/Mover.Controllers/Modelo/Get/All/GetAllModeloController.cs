
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Vehiculos;
using Mover.Presenter;
using Mover.UseCasesPorts.Modelo.Get.All;

namespace Mover.Controllers.Modelo.Get.All
{

    [Route("api/[controller]")]
    [ApiController]
    public class GetAllModeloController
    {

        readonly IGetAllModeloInPutPort getAllModeloInPutPort;
        readonly IGetAllModeloOutPutPort getAllModeloOutPutPort;

        public GetAllModeloController(IGetAllModeloInPutPort getAllModeloInPutPort, IGetAllModeloOutPutPort getAllModeloOutPutPort)
        {
            this.getAllModeloInPutPort = getAllModeloInPutPort;
            this.getAllModeloOutPutPort = getAllModeloOutPutPort;
        }


        [HttpGet]
        [Authorize]
        public async Task<List<ModeloDTO>> GetTipoIdentificacion()
        {
            await getAllModeloInPutPort.Handle();

            var result = ((IPresenter<List<ModeloDTO>>)getAllModeloOutPutPort).Content;

            return result;
        }

    }
}
