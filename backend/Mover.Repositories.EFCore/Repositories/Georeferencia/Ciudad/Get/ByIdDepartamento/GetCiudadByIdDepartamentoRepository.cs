using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.Entities.Interfaces.Georeferencia.Ciudad.Get.ByIdDepartamento;
using Mover.Entities.POCOEntities.Georeferencia;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Georeferencia.Ciudad.Get.ByIdDepartamento
{
    public class GetCiudadByIdDepartamentoRepository:IGetCiudadByIdDepartamentoRepository
    {
        readonly IMapper mapper;
        readonly MoverContext moverContext;

        public GetCiudadByIdDepartamentoRepository(IMapper mapper, MoverContext moverContext)
        {
            this.mapper = mapper;
            this.moverContext = moverContext;
        }

        public async Task<List<CiudadDTO>> GetCiudadByIdDepartamento(int departamentoId)
        {
            var lista = await moverContext.Ciudad.Where(x => x.DepartamentoId == departamentoId).ToListAsync();

            return mapper.Map<List<CiudadDTO>>(lista);  
        }
    }
}
