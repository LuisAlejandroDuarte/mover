
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Vehiculos;
using Mover.Entities.Interfaces.Categoria.Get.All;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Categoria.Get.All
{
    public class GetAllCategoriaRepository:IGetAllCategoriaRepository
    {
        readonly MoverContext moverContext;
        readonly IMapper mapper;

        public GetAllCategoriaRepository(MoverContext moverContext, IMapper mapper)
        {
            this.moverContext = moverContext;
            this.mapper = mapper;
        }

        public async Task<List<CategoriaDTO>> GetAllCategoria()
        {
            var listCategorias = await moverContext.Categoria.ToListAsync();

            var result = mapper.Map<List<CategoriaDTO>>(listCategorias);

            return result;
        }
    }
}
