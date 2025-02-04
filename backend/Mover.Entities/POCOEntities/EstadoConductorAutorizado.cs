
namespace Mover.Entities.POCOEntities
{
    public class EstadoConductorAutorizado
    {
        public int Id { get; set; }
        public string? Nombre { get; set; }

        public List<ConductorAutorizado>? ListConductorAutorizado { get; set; }
    }
}
