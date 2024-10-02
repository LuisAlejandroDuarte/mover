
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Titulos;
using Mover.Entities.Interfaces.Titulos.Listar;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Titulos.Listar
{
    public class ListaTitulosByTipoRepository : IListarTiulosByTipoRepository
    {
        private readonly MoverContext moverContext;
        private readonly IMapper imapper;

        public ListaTitulosByTipoRepository(MoverContext moverContext, IMapper imapper)
        {
            this.moverContext = moverContext;
            this.imapper = imapper;
        }

        public async Task<List<TitulosDTO>> GetListTitulos(string tipo)
        {            
            return this.imapper.Map<List<TitulosDTO>>(await moverContext.Titulos.Where(x => x.Tabla == tipo).ToListAsync());
        }
    }
}
