
namespace Mover.DTO.Vehiculos
{
    public class MarcaDTO
    {
        public int Id { get; set; }
        public int ClaseId { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;
        public List<ClaseMarcaDTO>? ClaseMarcaDTO { get; set; } 
    }
}
