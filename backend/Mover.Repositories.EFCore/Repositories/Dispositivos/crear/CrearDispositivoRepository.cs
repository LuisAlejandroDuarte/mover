
using AutoMapper;
using Mover.DTO.Dispositivo;
using Mover.Entities.Interfaces.Dispositivos.Crear;
using Mover.Entities.POCOEntities;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Dispositivos.crear
{
    public class CrearDispositivoRepository:ICrearDispositivoRepository
    {
        private readonly MoverContext moverContext;

        private readonly IMapper imapper;

        public CrearDispositivoRepository(MoverContext moverContext, IMapper imapper)
        {
            this.moverContext = moverContext;
            this.imapper = imapper;
        }

        public async Task<DispositivoDTO> Create(DispositivoDTO dispositivoDTO)
        {


            if (dispositivoDTO.User.TipoNaturaleza == 1)
                dispositivoDTO.User.Empresa = null;

            if (dispositivoDTO.User.TipoNaturaleza == 2)
                dispositivoDTO.User.PersonaNatural = null;

            var dispositivo = this.imapper.Map<Mover.Entities.POCOEntities.Dispositivos>(dispositivoDTO);
            this.moverContext.Add(dispositivo);
            await this.moverContext.SaveChangesAsync();

            var result = this.imapper.Map<DispositivoDTO>(dispositivo);

            return result;
        }

    }
}
