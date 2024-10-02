
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Equipo;
using Mover.Entities.Interfaces.Equipo.ListarByUser;
using Mover.Repositories.EFCore.DataContext;


namespace Mover.Repositories.EFCore.Repositories.Equipo.ListaByUser
{
    public class ListaEquipoByUserRepository : IListarEquipoByUserRepository
    {
        private readonly MoverContext moverContext;
        private readonly IMapper imapper;

        public ListaEquipoByUserRepository(MoverContext moverContext, IMapper imapper)
        {
            this.moverContext = moverContext;
            this.imapper = imapper;
        }

        public async Task<List<EquipoDTO>> GetListEquipoByUser(int IdUSer)
        {
            List<Entities.POCOEntities.Equipo> Equipos=await this.moverContext.Equipo.Where(x=>x.UserId== IdUSer).ToListAsync();

            List<EquipoDTO> EquipoDTOs = this.imapper.Map<List<EquipoDTO>>(Equipos);

            return EquipoDTOs;
        }
    }
}
