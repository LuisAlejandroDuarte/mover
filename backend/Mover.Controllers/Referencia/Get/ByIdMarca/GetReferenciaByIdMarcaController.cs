using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.DTO.Vehiculos;
using Mover.Presenter;
using Mover.UseCasesPorts.Referencia.Get.ByIdMarca;


namespace Mover.Controllers.Referencia.Get.ByIdMarca
{

    [Route("api/[controller]")]
    [ApiController]
    public class GetReferenciaByIdMarcaController
    {
        private readonly IGetReferenciaByIdMarcaInPutPort getReferenciaByIdMarcaInPutPort;
        private readonly IGetReferenciaByIdMarcaOutPutPort getReferenciaByIdMarcaOutPutPort;

        public GetReferenciaByIdMarcaController(IGetReferenciaByIdMarcaInPutPort getReferenciaByIdMarcaInPutPort, IGetReferenciaByIdMarcaOutPutPort getReferenciaByIdMarcaOutPutPort)
        {
            this.getReferenciaByIdMarcaInPutPort = getReferenciaByIdMarcaInPutPort;
            this.getReferenciaByIdMarcaOutPutPort = getReferenciaByIdMarcaOutPutPort;
        }
        [HttpGet]
        [Authorize]
        public async Task<List<ReferenciaDTO>> GetReferenciaByIdMarca(int idMarca)
        {
            await getReferenciaByIdMarcaInPutPort.Handle(idMarca);

            return ((IPresenter<List<ReferenciaDTO>>)getReferenciaByIdMarcaOutPutPort).Content;

        }

    }
}
