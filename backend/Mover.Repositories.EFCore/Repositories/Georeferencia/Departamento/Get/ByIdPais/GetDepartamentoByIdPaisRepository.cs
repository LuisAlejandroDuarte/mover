
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Dispositivo;
using Mover.Entities.Interfaces.Dispositivos.Get.ByDeviceId;
using Mover.Entities.Interfaces.Georeferencia.Departamento.Get.ByIdPais;
using Mover.Entities.POCOEntities.Georeferencia;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Georeferencia.Departamento.Get.ByIdPais
{
    public class GetDepartamentoByIdPaisRepository:IGetDepartamentoByIdPaisRepository
    {

        readonly IMapper mapper;
        readonly MoverContext moverContext;

        public GetDepartamentoByIdPaisRepository(IMapper mapper, MoverContext moverContext)
        {
            this.mapper = mapper;
            this.moverContext = moverContext;
        }

        public async Task<List<DepartamentoDTO>> GetDepartamentosByIdPais(int paisId)
        {
            var lista = await moverContext.Departamento.Where(x => x.PaisId == paisId).ToListAsync();

            return mapper.Map<List<DepartamentoDTO>>(lista);
        }
    }
}
