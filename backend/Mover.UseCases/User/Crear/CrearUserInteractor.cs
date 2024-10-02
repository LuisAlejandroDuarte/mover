using Microsoft.Extensions.Options;
using Mover.DTO.User;
using Mover.Entities.Interfaces;
using Mover.Entities.Interfaces.User.Crear;
using Mover.UseCases.Login.Settings;
using Mover.UseCasesPorts.User.Crear;
using System.IdentityModel.Tokens.Jwt;

namespace Mover.UseCases.User.Crear
{
    public class CrearUserInteractor : IUserCrearInPutPort
    {
        private readonly IUserCrearOutPutPort userCrearOutPutPort;        
        private readonly ICreearUserRepository creearUserRepository;
        private readonly JwtSettings jwtSettings;
        private readonly IUnitOfWork unitOfWork;

        public CrearUserInteractor(IUserCrearOutPutPort userCrearOutPutPort, ICreearUserRepository creearUserRepository, IUnitOfWork unitOfWork, IOptions<JwtSettings> jwtSettings)
        {
            this.userCrearOutPutPort = userCrearOutPutPort;
            this.creearUserRepository = creearUserRepository;
            this.unitOfWork = unitOfWork;
            this.jwtSettings = jwtSettings.Value;
        }

      

        public async Task Handle(UserDTO user)
        {
            var result = creearUserRepository.Create(user);
            result.Token = new JwtSecurityTokenHandler().WriteToken(GeneraToken.GeneratorToken(result, this.jwtSettings));
            await this.unitOfWork.SaveChanges();
            await userCrearOutPutPort.CrearUser(result);
        }
    }
}
