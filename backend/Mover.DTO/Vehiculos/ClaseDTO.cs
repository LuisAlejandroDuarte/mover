
namespace Mover.DTO.Vehiculos
{
    public class ClaseDTO
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;

        public int? CategoriaId { get; set; }        
        ICollection<ClaseMarcaDTO>? ClaseMarcaDTO { get; set; }
    }
}
