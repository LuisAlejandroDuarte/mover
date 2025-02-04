using Mover.DTO.User;

using Mover.Entities.Interfaces.User.Crear;
using Mover.Repositories.EFCore.DataContext;
using AutoMapper;

using Mover.DTO.PersonaNatural;
using Mover.DTO.Empresa;

namespace Mover.Repositories.EFCore.Repositories.User.Crear
{
    public class CrearUserRepository : ICreearUserRepository
    {
        private readonly MoverContext Context;
        private readonly IMapper imapper;

        public CrearUserRepository(MoverContext context, IMapper imapper)
        {
            Context = context;
            this.imapper = imapper;
        }

        public UserDTO Create(UserDTO user)
        {

            if (user.TipoNaturaleza==1)            
                user.Empresa = null;

            if (user.TipoNaturaleza == 2)
                user.PersonaNatural = null;                        

            var newUser = this.imapper.Map<Mover.Entities.POCOEntities.User> (user);

            Context.Add(newUser);
            Context.SaveChanges();
            user.Id = newUser.Id;

            return user;

            
        }
    }
}
