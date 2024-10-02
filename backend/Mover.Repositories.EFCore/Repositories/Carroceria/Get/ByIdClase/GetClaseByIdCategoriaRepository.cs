using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Vehiculos;
using Mover.Entities.Interfaces.Carroceria.Get.ByIdClase;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Carroceria.Get.ByIdClase
{
    public class GetCarroceriaByIdClaseRepository:IGetCarroceriaByIdClaseRepository
    {
        readonly MoverContext moverContext;
        readonly IMapper mapper;

        public GetCarroceriaByIdClaseRepository(MoverContext moverContext, IMapper mapper)
        {
            this.moverContext = moverContext;
            this.mapper = mapper;
        }

        public async Task<List<CarroceriaDTO>> GetCarroceriaByIdClase(int idClase)
        {
            var listCarrocerias = await moverContext.Carroceria.Where(x => x.ClaseId == idClase).ToListAsync();

            var result = mapper.Map<List<CarroceriaDTO>>(listCarrocerias);

            return result;
        }
    }
}
