

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Vehiculos;
using Mover.Presenter;
using Mover.UseCasesPorts.Marca.Get.ByIdClase;


namespace Mover.Controllers.Marca.Get.ByIdClase
{

    [Route("api/[controller]")]
    [ApiController]
    public class GetMarcaByIdClaseController
    {
        private readonly IGetMarcaByIdClaseInPutPort getMarcaByIdClaseInPutPort;
        private readonly IGetMarcaByIdClaseOutPutPort getMarcaByIdClaseOutPutPort;

        public GetMarcaByIdClaseController(IGetMarcaByIdClaseInPutPort getMarcaByIdClaseInPutPort, IGetMarcaByIdClaseOutPutPort getMarcaByIdClaseOutPutPort)
        {
            this.getMarcaByIdClaseInPutPort = getMarcaByIdClaseInPutPort;
            this.getMarcaByIdClaseOutPutPort = getMarcaByIdClaseOutPutPort;
        }


        [HttpGet]
        [Authorize]
        public async Task<List<MarcaDTO>> GetMarcaByIdClase(int idClase)
        {
            await getMarcaByIdClaseInPutPort.Handle(idClase);

            return ((IPresenter<List<MarcaDTO>>)getMarcaByIdClaseOutPutPort).Content;

        }
    }
}

