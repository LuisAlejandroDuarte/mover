
using Mover.Entities.Interfaces.Georeferencia.Ciudad.Get.ByIdDepartamento;
using Mover.UseCasesPorts.Georeferencia.Ciudad.Get.ByIdDepartamento;

namespace Mover.UseCases.Georeferencia.Ciudad.Get.ByIdDepartamento
{
    public class GetCiudadByIdDepartamentoInteractor:IGetCiudadByIdDepartamentoInPutPort
    {
        readonly IGetCiudadByIdDepartamentoRepository getCiudadByIdDepartamentoRepository;
        readonly IGetCiudadByIdDepartamentoOutPutPort getCiudadByIdDepartamentoOutPutPort;

        public GetCiudadByIdDepartamentoInteractor(IGetCiudadByIdDepartamentoRepository getCiudadByIdDepartamentoRepository, IGetCiudadByIdDepartamentoOutPutPort getCiudadByIdDepartamentoOutPutPort)
        {
            this.getCiudadByIdDepartamentoRepository = getCiudadByIdDepartamentoRepository;
            this.getCiudadByIdDepartamentoOutPutPort = getCiudadByIdDepartamentoOutPutPort;
        }

        public async Task Handle(int departamentoId)
        {
            var lista = await getCiudadByIdDepartamentoRepository.GetCiudadByIdDepartamento(departamentoId);

            await getCiudadByIdDepartamentoOutPutPort.GetCiudadByIdDepartamento(lista); 
        }
    }
}
