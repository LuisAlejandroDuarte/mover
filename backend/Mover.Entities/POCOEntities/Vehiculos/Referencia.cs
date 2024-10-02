
namespace Mover.Entities.POCOEntities.Vehiculos
{
    public class Referencia
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string? Descripcion { get; set; } 

        public int? MarcaId { get; set; }
        public Marca? Marca { get; set; }
    }
}
