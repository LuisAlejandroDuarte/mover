

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Vehiculos;
using Mover.Presenter;
using Mover.UseCasesPorts.Carroceria.Get.ByIdClase;




namespace Mover.Controllers.Carroceria.Get.ByIdClase
{

    [Route("api/[controller]")]
    [ApiController]
    public class GetCarroceriaByIdClaseController
    {
        private readonly IGetCarroceriaByIdClaseInPutPort getCarroceriaByIdClaseInPutPort;
        private readonly IGetCarroceriaByIdClaseOutPutPort getCarroceriaByIdClaseOutPutPort;

        public GetCarroceriaByIdClaseController(IGetCarroceriaByIdClaseInPutPort getCarroceriaByIdClaseInPutPort, IGetCarroceriaByIdClaseOutPutPort getCarroceriaByIdClaseOutPutPort)
        {
            this.getCarroceriaByIdClaseInPutPort = getCarroceriaByIdClaseInPutPort;
            this.getCarroceriaByIdClaseOutPutPort = getCarroceriaByIdClaseOutPutPort;
        }


        [HttpGet]
        [Authorize]
        public async Task<List<CarroceriaDTO>> GetCarroceriaByIdClase(int idClase)
        {
            await getCarroceriaByIdClaseInPutPort.Handle(idClase);

            return ((IPresenter<List<CarroceriaDTO>>)getCarroceriaByIdClaseOutPutPort).Content;

        }
    }
}

