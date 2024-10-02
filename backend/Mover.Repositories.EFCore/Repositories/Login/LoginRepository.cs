using AutoMapper;
using Mover.DTO.Login;
using Mover.DTO.User;
using Mover.Entities.Enums;
using Mover.Entities.Interfaces.Login;
using Mover.Repositories.EFCore.DataContext;


namespace Mover.Repositories.EFCore.Repositories.Login
{
    public class LoginRepository : ILoginRepository
    {
        private readonly MoverContext Context;
        private readonly IMapper imapper;

        public LoginRepository(MoverContext context,IMapper mapper)
        {
            Context = context;
            imapper = mapper;
        }

      


        public UserDTO Login(LoginDTO login)
        {
            var users = Context.Users?.FirstOrDefault(u => u.Email == login.Email);
            
            if (users == null)
            {
                throw new Exception("emailnotexist");
            }

            if (users.Password != login.Password)
            {
                throw new Exception("passwordnotcorrect");
            }


            return new UserDTO()
            {
                Id = users.Id,
                UserName = users.UserName,
                Identificacion = users.Identificacion,
                Nombre = users.Nombre,
                Apellido = users.Apellido,
                Direccion = users.Direccion,
                Telefono = users.Telefono,               
                UltimaSesion = users.UltimaSesion                
            };

        }
    }
}
