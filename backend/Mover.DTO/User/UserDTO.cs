
namespace Mover.DTO.User
{
    public class UserDTO
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Apellido { get; set; } = string.Empty;
        public string Identificacion { get; set; } = string.Empty;

        public string Direccion { get; set; } = string.Empty;
        public string Telefono { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string UserName { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public string Token { get; set; } = string.Empty;
        public int? TipoUserId { get; set; }
        public int? TipoIdentificacionId { get; set; }
        public int? EstadoUsuarioId { get; set; }
        public DateTime? UltimaSesion { get; set; }
    }
}
