using Mover.DTO.User;
using Mover.Repositories.EFCore.Utils;
using Mover.Entities.Interfaces.User.Crear;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.User.Crear
{
    public class CrearUserRepository : ICreearUserRepository
    {
        private readonly MoverContext Context;

        public CrearUserRepository(MoverContext context)
        {
            Context = context;
        }

        public UserDTO Create(UserDTO user)
        {            
            var usuario  = Context.Users.FirstOrDefault(x=>x.Email == user.Email);
            if (usuario != null)
            {                
                throw new Exception("emailalreadyexists");               
            }

           usuario = Context.Users.FirstOrDefault(x => x.Identificacion == user.Identificacion);
            if (usuario != null)
            {
                throw new Exception("identificationalreadyexists");
            }

            Mover.Entities.POCOEntities.User newUser = new()
            {
                Nombre = user.Nombre,
                Apellido = user.Apellido,
                Email = user.Email,
                Direccion = user.Direccion,
                TipoUserId = user.TipoUserId,
                UserName = user.UserName,
                Identificacion = user.Identificacion,
                TipoIdentificacionId = user.TipoIdentificacionId,
                Telefono = user.Telefono,
                UltimaSesion =user.UltimaSesion,
                EstadoUsuarioId=1,
                Password = PasswordHasher.HashPassword(user.Password)
            };


            Context.Add(newUser);
            Context.SaveChanges();
            user.Id = newUser.Id;

            return user;

            
        }
    }
}
