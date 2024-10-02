using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mover.UseCases.AuthService;

namespace Mover.Controllers.Auth
{


    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _authService;

        public AuthController(IAuthService authService)
        {
            _authService = authService;
        }

        [HttpPost("token")]
        [AllowAnonymous]
        public IActionResult Token()
        {           
            var token = _authService.Authenticate();
            return Ok(new { Token = token });
        }
    }
}

