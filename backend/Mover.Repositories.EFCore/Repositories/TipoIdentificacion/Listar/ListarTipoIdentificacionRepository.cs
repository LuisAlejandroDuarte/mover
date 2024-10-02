
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.TipoIdentificacion;
using Mover.Entities.Interfaces.TipoIdentificacion.Listar;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.TipoIdentificacion.Listar
{  

    public class ListarTipoIdentificacionRepository : IListarTipoIdentificacionRepository
    {
        private readonly MoverContext moverContext;
        private readonly IMapper mapper;

        public ListarTipoIdentificacionRepository(MoverContext moverContext,IMapper mapper)
        {
            this.moverContext = moverContext;
            this.mapper = mapper;
        }

        public async Task<List<TipoIdentificacionDTO>> GetTipoIdentificacion()
        {
            var tipoIdentificaciones = await moverContext.TipoIdentificacion.ToListAsync();

            var result = mapper.Map<List<TipoIdentificacionDTO>>(tipoIdentificaciones);

            return result;
        }

    }
}
