
using Microsoft.Extensions.Options;
using Mover.DTO.Login;
using Mover.Entities.Interfaces.Login;
using Mover.UseCases.Login.Settings;
using Mover.UseCasesPorts.Login;
using System.IdentityModel.Tokens.Jwt;

namespace Mover.UseCases.Login
{
    public class LoginInteractor : ILoginInPutPort
    {
        private readonly ILoginRepository Repository;
        private readonly ILoginOutPutPort OutputPort;
        private readonly JwtSettings jwtSettings;

        public LoginInteractor(ILoginRepository repository, ILoginOutPutPort outputPort, IOptions<JwtSettings> jwtSettings)
        {
            Repository = repository;
            OutputPort = outputPort;
            this.jwtSettings = jwtSettings.Value;
        }

        public Task Handle(LoginDTO login)
        {
            var usuario = Repository.Login(login);

            usuario.Token = new JwtSecurityTokenHandler().WriteToken(GeneraToken.GeneratorToken(usuario, jwtSettings));

            OutputPort.Handle(usuario);
            return Task.CompletedTask;
        }

    }
}
