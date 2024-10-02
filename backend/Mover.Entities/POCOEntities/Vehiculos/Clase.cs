
namespace Mover.Entities.POCOEntities.Vehiculos
{
    public class Clase
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;

        public int? CategoriaId { get; set; }
        public Categoria? Categoria { get; set; }
        public ICollection<ClaseMarca>? ClaseMarca { get; set; }
    }
}
