
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Oferta;
using Mover.Entities.Interfaces.Oferta.ListaByUser;
using Mover.Repositories.EFCore.DataContext;


namespace Mover.Repositories.EFCore.Repositories.Oferta.ListaByUser
{
    public class ListaOfertaByUserRepository : IListaOfertaByUserRepository
    {
        private readonly MoverContext moverContext;
        private readonly IMapper imapper;

        public ListaOfertaByUserRepository(MoverContext moverContext, IMapper imapper)
        {
            this.moverContext = moverContext;
            this.imapper = imapper;
        }

        public async Task<List<OfertaDTO>> GetListaOfertaByUser(int IdUSer)
        {
            List<Entities.POCOEntities.Oferta> ofertas=await this.moverContext.Oferta.Where(x=>x.UserId== IdUSer).ToListAsync();

            List<OfertaDTO> ofertaDTOs = this.imapper.Map<List<OfertaDTO>>(ofertas);

            return ofertaDTOs;
        }
    }
}
