using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Vehiculos;
using Mover.Entities.Interfaces.Marca.Get.ByIdClase;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Marca.Get.ByIdClase
{
    public class GetMarcaByIdClaseRepository : IGetMarcaByIdClaseRepository
    {
        readonly MoverContext moverContext;
        readonly IMapper mapper;

        public GetMarcaByIdClaseRepository(MoverContext moverContext, IMapper mapper)
        {
            this.moverContext = moverContext;
            this.mapper = mapper;
        }

        public async Task<List<MarcaDTO>> GetMarcaByIdClase(int idClase)
        {
            var listMarcas = await moverContext.ClaseMarca.Where(x => x.ClaseId == idClase).
                Include(cm => cm.Marca).
                Select(cm => cm.Marca).ToListAsync();

            var result = mapper.Map<List<MarcaDTO>>(listMarcas);

            return result;
        }
    }
}
