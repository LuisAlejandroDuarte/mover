
namespace Mover.Entities.POCOEntities
{
    public class EstadoEquipo
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;

        public List<Equipo>? ListEquipo { get; set; }
    }
}
