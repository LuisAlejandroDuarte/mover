using Jose;
using Microsoft.IdentityModel.Tokens;
using Mover.Entities.POCOEntities;
using Mover.UseCases.AuthService;
using Mover.UseCases.Login.Settings;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Mover.API.Authenticator
{


    public class JwtTokenGenerator : ITokenGenerator
    {
        private readonly IConfiguration _configuration;

        public JwtTokenGenerator(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public string GenerateToken()
        {
            var claims = new[]
             {
               new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
             };

            var symetricSecurityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JwtSettings:Key"]!));

            var signingCredetials = new SigningCredentials(symetricSecurityKey, SecurityAlgorithms.HmacSha256);

            var jwtSecurityToken = new JwtSecurityToken(

                issuer: _configuration["JwtSettings:Issuer"]!,
                audience: _configuration["JwtSettings:Audience"]!,
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(Convert.ToDouble(_configuration["JwtSettings:DurationInMinutes"]!)),
                signingCredentials: signingCredetials
           );




            return new JwtSecurityTokenHandler().WriteToken(jwtSecurityToken);
        }
    }
}