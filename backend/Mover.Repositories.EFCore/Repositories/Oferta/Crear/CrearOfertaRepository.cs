
using AutoMapper;
using Mover.DTO.Oferta;
using Mover.Entities.Interfaces.Oferta.Crear;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Oferta.Crear
{
    public class CrearOfertaRepository:ICrearOfertaRepository
    {
        private readonly MoverContext moverContext;

        private readonly IMapper imapper;
      

        public CrearOfertaRepository(MoverContext moverContext,IMapper mapper)
        {
            this.moverContext = moverContext;
            this.imapper= mapper;
      
        }

        public async Task<int>  CrearOferta(OfertaDTO oferta)
        {
            var ofertanew = this.imapper.Map<Mover.Entities.POCOEntities.Oferta>(oferta);
            this.moverContext.Add(ofertanew);
            await this.moverContext.SaveChangesAsync();
            return ofertanew.Id;
        }
    }
}
