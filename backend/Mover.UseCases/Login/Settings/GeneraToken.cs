
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Mover.DTO.User;

namespace Mover.UseCases.Login.Settings
{
    public static class GeneraToken
    {
        public static JwtSecurityToken GeneratorToken(UserDTO user, JwtSettings jwtSettings)
        {            

            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub,user.UserName) ,
                new Claim(CustomClaimTypes.Uid,user.Id.ToString()),
                new Claim(CustomClaimTypes.TipoUserId, user.TipoUserId.ToString()!)
            };

            var symetricSecurityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtSettings.Key));

            var signingCredetials = new SigningCredentials(symetricSecurityKey, SecurityAlgorithms.HmacSha256);

            var jwtSecurityToken = new JwtSecurityToken(

                issuer: jwtSettings.Issuer,
                audience: jwtSettings.Audience,
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(jwtSettings.DurationInMinutes),
                signingCredentials: signingCredetials
           );

            return jwtSecurityToken;
        }
    }
}
