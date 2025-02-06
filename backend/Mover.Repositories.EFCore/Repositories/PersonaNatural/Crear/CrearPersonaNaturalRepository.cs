

using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.PersonaNatural;
using Mover.Entities.Interfaces.PersonaNatural.Crear;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.PersonaNatural.Crear
{
    public class CrearPersonaNaturalRepository : ICrearPersonaNaturalRepository
    {

        private readonly MoverContext moverContext;
        private readonly IMapper mapper;

        public CrearPersonaNaturalRepository(MoverContext moverContext, IMapper mapper)
        {
            this.moverContext = moverContext;
            this.mapper = mapper;
        }

        public async Task<PersonaNaturalDTO> CrearPersonaNatural(PersonaNaturalDTO personaNatural)
        {
           var email =await this.moverContext.PersonaNatural.FirstOrDefaultAsync(x=>x.Email == personaNatural.Email);
            if (email != null) {
                throw new Exception("El Email ya existe");
            }

            var persona = this.mapper.Map<Mover.Entities.POCOEntities.PersonaNatural>(personaNatural);
            moverContext.Add(persona);

             personaNatural = this.mapper.Map<PersonaNaturalDTO>(persona);

            moverContext.SaveChanges();

            return personaNatural;

        }
    }
}
