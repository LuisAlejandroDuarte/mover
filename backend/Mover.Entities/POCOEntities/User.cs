

namespace Mover.Entities.POCOEntities
{
    public class User
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
        public int? TipoUserId { get; set; }
        public int? TipoIdentificacionId { get; set; }
        public DateTime? UltimaSesion { get; set; }
        public int? EstadoUsuarioId { get; set; }
        

        public TipoUser? TipoUser { get; set; }
        public TipoIdentificacion? TipoIdentificacion { get; set; }
        public EstadoUsuario? EstadoUsuario { get; set; }
        public List<Equipo>? ListEquipos { get; set; }
        public List<ConductorAutorizado>? ListConductorAutorizado { get; set; }
        


    }
}
