
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Vehiculos;
using Mover.Entities.Interfaces.Clase.Get.ByIdCategoria;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Clase.Get.ByIdCategoria
{
    public class GetClaseByIdCategoriaRepository:IGetClaseByIdCategoriaRepository
    {
        readonly MoverContext moverContext;
        readonly IMapper mapper;

        public GetClaseByIdCategoriaRepository(MoverContext moverContext, IMapper mapper)
        {
            this.moverContext = moverContext;
            this.mapper = mapper;
        }

        public async Task<List<ClaseDTO>> GetClaseByIdCategoria(int idCategoria)
        {
            var listClases = await moverContext.Clase.Where(x => x.CategoriaId == idCategoria).ToListAsync();

            var result = mapper.Map<List<ClaseDTO>>(listClases);

            return result;
        }
    }
}
