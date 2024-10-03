
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.EstadoOferta;
using Mover.Entities.Interfaces.EstadoOferta;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.EstadoOferta
{
    public class GetAllEstadoOfertaRepository:IGetAllEstadoOfertaRepository
    {
        readonly MoverContext moverContext;
        readonly IMapper mapper;

        public GetAllEstadoOfertaRepository(MoverContext moverContext, IMapper mapper)
        {
            this.moverContext = moverContext;
            this.mapper = mapper;
        }

        public async Task<List<EstadoOfertaDTO>> GetAllEstadoOferta()
        {
            var lista = await moverContext.EstadoOferta.ToListAsync();

            return  mapper.Map<List<EstadoOfertaDTO>>(lista);
        }
    }
}
