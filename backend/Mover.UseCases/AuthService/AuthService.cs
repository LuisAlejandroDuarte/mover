
namespace Mover.UseCases.AuthService
{
  
    public class AuthService : IAuthService
    {
        private readonly ITokenGenerator _tokenGenerator;

        public AuthService(ITokenGenerator tokenGenerator)
        {
            _tokenGenerator = tokenGenerator;
        }

        public string Authenticate()
        {           

            return _tokenGenerator.GenerateToken();
        }
    }
    
}
