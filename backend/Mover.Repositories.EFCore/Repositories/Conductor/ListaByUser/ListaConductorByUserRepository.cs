
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.ConductorAutorizado;
using Mover.Entities.Interfaces.ConductorAutorizado.ListarByUser;
using Mover.Repositories.EFCore.DataContext;


namespace Mover.Repositories.EFCore.Repositories.Conductor.ListaByUser
{
    public class ListaConductorByUserRepository : IListarConductorByUserRepository
    {
        private readonly MoverContext moverContext;
        private readonly IMapper imapper;

        public ListaConductorByUserRepository(MoverContext moverContext, IMapper imapper)
        {
            this.moverContext = moverContext;
            this.imapper = imapper;
        }

        public async Task<List<ConductorAutorizadoDTO>> GetListEquipoByUser(int IdUSer)
        {
            List<Entities.POCOEntities.ConductorAutorizado> Conductors=await this.moverContext.ConductorAutorizado.Where(x=>x.UserId== IdUSer).ToListAsync();

            List<ConductorAutorizadoDTO> ConductorDTOs = this.imapper.Map<List<ConductorAutorizadoDTO>>(Conductors);

            return ConductorDTOs;
        }
    }
}
