

namespace Mover.Entities.POCOEntities
{
    public class EquipoConductor
    {
        // Claves foráneas
        public int EquipoId { get; set; }
        public Equipo? Equipo { get; set; }

        public int ConductorAutorizadoId { get; set; }
        public ConductorAutorizado? ConductorAutorizado { get; set; }
    }
}
