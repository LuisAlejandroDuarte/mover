
using Mover.DTO.ConductorAutorizado;
using Mover.DTO.Empresa;
using Mover.DTO.Equipo;
using Mover.DTO.PersonaNatural;

namespace Mover.DTO.User
{
    public class UserDTO
    {
        public int Id { get; set; }      
        public string UserName { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public string Token { get; set; } = string.Empty;
        public int? TipoUserId { get; set; }
        public int? TipoNaturaleza { get; set; }        
        public DateTime? UltimaSesion { get; set; }
        public int? EstadoUsuarioId { get; set; }


        
        
        public List<EquipoDTO>? ListEquipos { get; set; }
        public List<ConductorAutorizadoDTO>? ListConductorAutorizado { get; set; }

        public PersonaNaturalDTO? PersonaNatural { get; set; }
        public EmpresaDTO? Empresa { get; set; }

    }
}
