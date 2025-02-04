
namespace Mover.DTO.PersonaNatural
{
    public class PersonaNaturalDTO
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Apellido { get; set; } = string.Empty;
        public string Direccion { get; set; } = string.Empty;
        public string Telefono { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public int? TipoIdentificacionId { get; set; }
        public string Identificacion { get; set; } = string.Empty;
        
    }
}
