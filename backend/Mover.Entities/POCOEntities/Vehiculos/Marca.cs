
namespace Mover.Entities.POCOEntities.Vehiculos
{
    public class Marca
    {
        public int Id { get; set; }       
        public string Nombre { get; set; } = string.Empty;
        public string? Descripcion { get; set; } = string.Empty;
        public ICollection<ClaseMarca>? ClaseMarca { get; set; }

    }
}
