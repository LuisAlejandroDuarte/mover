using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Vehiculos;
using Mover.Entities.Interfaces.Modelo.Gett.All;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Modelos.Get.All
{
    public class GetAllModeloRepository : IGetAllModeloRepository
    {
        readonly MoverContext moverContext;
        readonly IMapper mapper;

        public GetAllModeloRepository(MoverContext moverContext, IMapper mapper)
        {
            this.moverContext = moverContext;
            this.mapper = mapper;
        }

        public async Task<List<ModeloDTO>> GetAllModelo()
        {
            var listaModelos = await moverContext.Modelo.ToListAsync();

            return mapper.Map<List<ModeloDTO>>(listaModelos.OrderByDescending(x => x.Id));
        }
    }
}
