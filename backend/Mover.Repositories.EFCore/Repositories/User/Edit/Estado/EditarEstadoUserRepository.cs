

using AutoMapper;
using Mover.DTO.User;
using Mover.Entities.Enums;
using Mover.Entities.Interfaces.User.Edit.Estado;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.User.Edit.Estado
{
    public class EditarEstadoUserRepository : IUserEditarEstadoRepository
    {

        private readonly MoverContext Context;
        private readonly IMapper imapper;

        public EditarEstadoUserRepository(MoverContext context, IMapper imapper)
        {
            Context = context;
            this.imapper = imapper;
        }

        public bool EditarEstadoUser(UserDTO userDTO)
        {
            var user = this.Context.Users.Find(userDTO.Id);
            if (user == null)
            {
                throw new InvalidOperationException("No existe el usuario");
            }

            user.EstadoUsuarioId = userDTO.EstadoUsuarioId;
            user.TipoUserId = userDTO.TipoUserId;
            user.TipoNaturaleza = (TipoNaturaleza)userDTO.TipoNaturaleza;


            this.Context.Update(user);
            this.Context.SaveChanges();


            bool result = true;

            return result;
        }

    }
}
