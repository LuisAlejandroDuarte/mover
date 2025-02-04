namespace Mover.Entities.POCOEntities
{
    public class PersonaNatural
    {
        public int Id { get; set; }
        public User? User { get; set; }
        public int UserId { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Apellido { get; set; } = string.Empty;
        public string Direccion { get; set; } = string.Empty;
        public string Telefono { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public int? TipoIdentificacionId { get; set; }
        public TipoIdentificacion? TipoIdentificacion { get; set; }
        public string Identificacion { get; set; } = string.Empty;
        
    }
}
