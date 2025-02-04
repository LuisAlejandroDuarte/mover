

using Mover.Entities.Enums;

namespace Mover.Entities.POCOEntities
{
    public class User
    {
        public int Id { get; set; }      
        public string UserName { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public int? TipoUserId { get; set; }     
        public TipoNaturaleza? TipoNaturaleza { get; set; }
        public DateTime? UltimaSesion { get; set; }
        public int? EstadoUsuarioId { get; set; }
        

        public TipoUser? TipoUser { get; set; }        
        public EstadoUsuario? EstadoUsuario { get; set; }
        public List<Equipo>? ListEquipos { get; set; }
        public List<ConductorAutorizado>? ListConductorAutorizado { get; set; }

        public PersonaNatural? PersonaNatural { get; set; }
        public Empresa? Empresa { get; set; }

    }
}
